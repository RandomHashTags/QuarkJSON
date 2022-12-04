//
//  json_object.c
//  quark
//
//  Created by Evan Anderson on 11/25/22.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <fcntl.h>
#include <assert.h>
#include <unistd.h>
#include "json_object.h"

void json_object_destroy(struct JSONObject *json) {
    json_object_destroy_heap_elements(json->booleans_count, json->booleans, json->strings_count, json->strings, json->numbers_count, json->numbers, json->jsons_count, json->jsons);
}
static void json_object_destroy_heap_elements(const unsigned long booleans_count, struct JSONObjectValueBoolean *booleans, const unsigned long strings_count, struct JSONObjectValueString *strings, const unsigned long numbers_count, struct JSONObjectValueNumber *numbers, const unsigned long jsons_count, struct JSONObject *jsons) {
    json_object_destroy_stack_elements(booleans_count, booleans, strings_count, strings, numbers_count, numbers, jsons_count, jsons);
    free(booleans);
    free(strings);
    free(numbers);
    free(jsons);
}
static void json_object_destroy_stack_elements(const unsigned long booleans_count, struct JSONObjectValueBoolean *booleans, const unsigned long strings_count, struct JSONObjectValueString *strings, const unsigned long numbers_count, struct JSONObjectValueNumber *numbers, const unsigned long jsons_count, struct JSONObject *jsons) {
    for (unsigned long i = 0; i < booleans_count; i++) {
        struct JSONObjectValueBoolean boolean = booleans[i];
        free(boolean.key);
    }
    
    for (unsigned long i = 0; i < strings_count; i++) {
        struct JSONObjectValueString string = strings[i];
        free(string.key);
        free(string.value);
    }

    for (unsigned long i = 0; i < numbers_count; i++) {
        struct JSONObjectValueNumber number = numbers[i];
        free(number.key);
        free(number.value);
    }

    for (unsigned long i = 0; i < jsons_count; i++) {
        struct JSONObject json = jsons[i];
        json_object_destroy(&json);
    }
}

void json_object_calculate_string_length(struct JSONObject *json) {
    unsigned long bytes = 2;
    
    const unsigned long booleans_count = json->booleans_count;
    struct JSONObjectValueBoolean *booleans = json->booleans;
    for (unsigned long i = 0; i < booleans_count; i++) {
        struct JSONObjectValueBoolean boolean = booleans[i];
        bytes += boolean.to_string_length + 1;
    }
    
    const unsigned long strings_count = json->strings_count;
    struct JSONObjectValueString *strings = json->strings;
    for (unsigned long i = 0; i < strings_count; i++) {
        struct JSONObjectValueString string = strings[i];
        bytes += string.to_string_length + 1;
    }

    const unsigned long numbers_count = json->numbers_count;
    struct JSONObjectValueNumber *numbers = json->numbers;
    for (unsigned long i = 0; i < numbers_count; i++) {
        struct JSONObjectValueNumber number = numbers[i];
        bytes += number.to_string_length + 1;
    }

    const unsigned long jsons_count = json->jsons_count;
    struct JSONObject *jsons = json->jsons;
    for (unsigned long i = 0; i < jsons_count; i++) {
        struct JSONObject json = jsons[i];
        bytes += json.to_string_length + 1 + (json.has_key ? json.key_length + 3 : 0);
    }

    json->to_string_length = bytes-1;
}

void json_object_to_string(struct JSONObject *json, char *to_string) {
    to_string[0] = '{';
    
    unsigned long byte = 1;
    
    struct JSONObjectValueBoolean *booleans = json->booleans;
    const unsigned long booleans_count = json->booleans_count;
    for (unsigned long i = 0; i < booleans_count; i++) {
        struct JSONObjectValueBoolean boolean = booleans[i];
        const unsigned long string_length = boolean.to_string_length;
        char boolean_to_string[string_length];
        json_object_value_boolean_to_string(&boolean, boolean_to_string);
        
        for (unsigned long j = 0; j < string_length; j++) {
            to_string[byte + j] = boolean_to_string[j];
        }
        byte += string_length + 1;
        to_string[byte-1] = ',';
    }
    
    const unsigned long strings_count = json->strings_count;
    struct JSONObjectValueString *strings = json->strings;
    for (unsigned long i = 0; i < strings_count; i++) {
        struct JSONObjectValueString string = strings[i];
        const unsigned long string_length = string.to_string_length;
        char string_to_string[string_length];
        json_object_value_string_to_string(&string, string_to_string);
        
        for (unsigned long j = 0; j < string_length; j++) {
            to_string[byte + j] = string_to_string[j];
        }
        byte += string_length + 1;
        to_string[byte-1] = ',';
    }

    const unsigned long numbers_count = json->numbers_count;
    struct JSONObjectValueNumber *numbers = json->numbers;
    for (unsigned long i = 0; i < numbers_count; i++) {
        struct JSONObjectValueNumber number = numbers[i];
        const unsigned long number_length = number.to_string_length;
        char number_to_string[number_length];
        json_object_value_number_to_string(&number, number_to_string);

        for (unsigned long j = 0; j < number_length; j++) {
            to_string[byte + j] = number_to_string[j];
        }
        byte += number_length + 1;
        to_string[byte-1] = ',';
    }

    const unsigned long jsons_count = json->jsons_count;
    struct JSONObject *jsons = json->jsons;
    for (unsigned long i = 0; i < jsons_count; i++) {
        struct JSONObject target_json = jsons[i];
        to_string[byte] = '"';
        byte += 1;
        const char *key = target_json.key;
        const unsigned char key_length = target_json.key_length;
        for (unsigned long j = 0; j < key_length; j++) {
            to_string[byte + j] = key[j];
        }
        byte += key_length + 2;
        to_string[byte-2] = '"';
        to_string[byte-1] = ':';

        const unsigned long json_length = target_json.to_string_length;
        char json_to_string[json_length];
        json_object_to_string(&target_json, json_to_string);
        for (unsigned long j = 0; j < json_length; j++) {
            to_string[byte + j] = json_to_string[j];
        }
        byte += json_length + 1;
        to_string[byte-1] = ',';
    }

    to_string[byte-1] = '}';
    to_string[byte] = '\0';
}

void json_object_value_create_boolean(char *key, unsigned char key_length, _Bool value, struct JSONObjectValueBoolean *boolean) {
    struct JSONObjectValueBoolean value_boolean = {
        .key = key,
        .key_length = key_length,
        .value = value,
        .to_string_length = key_length + 7 + !value
    };
    *boolean = value_boolean;
}
void json_object_value_create_string(char *key, unsigned char key_length, char *value, unsigned char value_length, struct JSONObjectValueString *string) {
    struct JSONObjectValueString value_string = {
        .key = key,
        .key_length = key_length,
        .value = value,
        .value_length = value_length,
        .to_string_length = key_length + value_length + 5
    };
    *string = value_string;
}
void json_object_value_create_number(char *key, unsigned char key_length, char *value, unsigned char value_length, struct JSONObjectValueNumber *number) {
    struct JSONObjectValueNumber value_number = {
        .key = key,
        .key_length = key_length,
        .value = value,
        .value_length = value_length,
        .to_string_length = key_length + value_length + 3
    };
    *number = value_number;
}

void json_object_value_boolean_to_string(struct JSONObjectValueBoolean *value_boolean, char *to_string) {
    const char *key = value_boolean->key;
    const unsigned char key_length = value_boolean->key_length;
    const _Bool value = value_boolean->value;
    const char *value_characters = value ? "true" : "false";
    
    to_string[0] = '"';
    unsigned long byte = 1;
    for (unsigned char j = 0; j < key_length; j++) {
        to_string[byte + j] = key[j];
    }
    byte += key_length + 2;
    to_string[byte-2] = '"';
    to_string[byte-1] = ':';
    
    const unsigned char amount = value ? 4 : 5;
    for (unsigned char j = 0; j < amount; j++) {
        to_string[byte + j] = value_characters[j];
    }
    byte += amount;
    to_string[byte] = '\0';
}
void json_object_value_string_to_string(struct JSONObjectValueString *value_string, char *to_string) {
    const unsigned char key_length = value_string->key_length, value_length = value_string->value_length;
    
    to_string[0] = '"';
    unsigned short byte = 1;
    const char *key = value_string->key;
    for (unsigned char i = 0; i < key_length; i++) {
        to_string[byte + i] = key[i];
    }
    byte += key_length + 3;
    to_string[byte-3] = '"';
    to_string[byte-2] = ':';
    to_string[byte-1] = '"';
    
    const char *value = value_string->value;
    for (unsigned char i = 0; i < value_length; i++) {
        to_string[byte + i] = value[i];
    }
    byte += value_length+1;
    to_string[byte-1] = '"';
    to_string[byte] = '\0';
}
void json_object_value_number_to_string(struct JSONObjectValueNumber *value_number, char *to_string) {
    const unsigned char key_length = value_number->key_length, value_length = value_number->value_length;
    
    to_string[0] = '"';
    unsigned short byte = 1;
    const char *key = value_number->key;
    for (unsigned char i = 0; i < key_length; i++) {
        to_string[byte + i] = key[i];
    }
    byte += key_length + 2;
    to_string[byte-2] = '"';
    to_string[byte-1] = ':';
    
    const char *value = value_number->value;
    for (unsigned char i = 0; i < value_length; i++) {
        to_string[byte + i] = value[i];
    }
    byte += value_length;
    to_string[byte] = '\0';
}

void json_object_parse_from_file(const char *file_path, struct JSONObject *parsed_json) {
    json_object_parse_fixed_size_from_file(file_path, 20, 20, 20, 10, parsed_json);
}
void json_object_parse_fixed_size_from_file(const char *file_path, const unsigned long string_count, const unsigned long boolean_count, const unsigned long number_count, const unsigned long json_count, struct JSONObject *parsed_json) {
    int fd; 
    struct stat statistic; 
    char *buffer; 
    assert((fd = open(file_path, O_RDONLY))>= 0); 
    assert(fstat(fd, &statistic) == 0); 
    assert((buffer = (char *) mmap(NULL, statistic.st_size, PROT_READ, MAP_SHARED, fd, 0)) != NULL);
    json_object_parse_fixed_size(buffer, statistic.st_size, string_count, boolean_count, number_count, json_count, parsed_json);
}

void json_object_parse(const char *string, const unsigned long string_length, struct JSONObject *parsed_json) {
    json_object_parse_starting_at(1, string, string_length, parsed_json);
}
static void json_object_parse_starting_at(unsigned long byte, const char *string, const unsigned long string_length, struct JSONObject *parsed_json) {
    json_object_parse_fixed_size_starting_at(byte, string, string_length, 20, 20, 20, 10, parsed_json);
}
void json_object_parse_fixed_size(const char *string, const unsigned long string_length, const unsigned long string_count, const unsigned long boolean_count, const unsigned long number_count, const unsigned long json_count, struct JSONObject *parsed_json) {
    json_object_parse_fixed_size_starting_at(1, string, string_length, string_count, boolean_count, number_count, json_count, parsed_json);
}
static void json_object_parse_fixed_size_starting_at(unsigned long byte, const char *string, const unsigned long string_length, const unsigned long string_count, const unsigned long boolean_count, const unsigned long number_count, const unsigned long json_count, struct JSONObject *parsed_json) {
    const size_t sizeof_char = sizeof(char);
    const size_t sizeof_boolean = sizeof(struct JSONObjectValueBoolean);
    const size_t sizeof_string = sizeof(struct JSONObjectValueString);
    const size_t sizeof_number = sizeof(struct JSONObjectValueNumber);
    const size_t sizeof_json = sizeof(struct JSONObject);

    char *key = NULL;
    unsigned char key_length = 0;
    
    unsigned long booleans_count = 0;
    struct JSONObjectValueBoolean *booleans = alloca(boolean_count * sizeof_boolean);

    unsigned long strings_count = 0;
    struct JSONObjectValueString *strings = alloca(string_count * sizeof_string);

    unsigned long numbers_count = 0;
    struct JSONObjectValueNumber *numbers = alloca(number_count * sizeof_number);

    unsigned long jsons_count = 0;
    struct JSONObject *jsons = alloca(json_count * sizeof_json);
    
    for (; byte < string_length; byte++) {
        char target_character = string[byte];
        switch (target_character) {
            case '}': {
                byte = string_length;
                break;
            } case '"': {
                byte += 1;
                char string_key_array[128];
                json_parse_string(string, string_length, byte, string_key_array);
                key_length = strlen(string_key_array);
                key = alloca(key_length * sizeof_char);
                strcpy(key, string_key_array);
                byte += key_length;
                break;
            } case ':': {
                byte += 1;
                target_character = string[byte];
                switch (target_character) {
                    case '-':
                    case '0':
                    case '1':
                    case '2':
                    case '3':
                    case '4':
                    case '5':
                    case '6':
                    case '7':
                    case '8':
                    case '9': {
                        char number_value_as_string[16];
                        unsigned char number_value_length;
                        json_parse_number(string, string_length, byte, number_value_as_string, &number_value_length);
                        byte += number_value_length;
                        char *value = alloca(number_value_length * sizeof_char);
                        strcpy(value, number_value_as_string);
                        struct JSONObjectValueNumber value_number;
                        json_object_value_create_number(key, key_length, value, number_value_length, &value_number);
                        numbers[numbers_count] = value_number;
                        numbers_count += 1;
                        break;
                    } case 'n': {
                        break;
                    } case 'f':
                    case 't': {
                        const _Bool value = target_character == 't';
                        byte += 4 + !value;
                        struct JSONObjectValueBoolean value_boolean;
                        json_object_value_create_boolean(key, key_length, value, &value_boolean);
                        booleans[booleans_count] = value_boolean;
                        booleans_count += 1;
                        break;
                    } case '"': {
                        char string_value_array[256];
                        json_parse_string(string, string_length, byte+1, string_value_array);
                        const unsigned char value_length = strlen(string_value_array);
                        byte += value_length + 1;
                        char *value = alloca(value_length * sizeof_char);
                        strcpy(value, string_value_array);
                        struct JSONObjectValueString value_string;
                        json_object_value_create_string(key, key_length, value, value_length, &value_string);
                        strings[strings_count] = value_string;
                        strings_count += 1;
                        break;
                    } case '{': {
                        struct JSONObject target_json;
                        json_object_parse_starting_at(byte+1, string, string_length, &target_json);
                        target_json.has_key = 1;
                        target_json.key = key;
                        target_json.key_length = key_length;
                        const unsigned long length = target_json.to_string_length;
                        jsons[jsons_count] = target_json;
                        jsons_count += 1;
                        byte += length;
                        break;
                    } case '[': {
                        // TODO: finish
                        break;
                    } default: {
                        break;
                    }
                }
                break;
            } default: {
                break;
            }
        }
    }
    parsed_json->booleans_count = booleans_count;
    parsed_json->booleans = booleans;
    parsed_json->strings_count = strings_count;
    parsed_json->strings = strings;
    parsed_json->numbers_count = numbers_count;
    parsed_json->numbers = numbers;
    parsed_json->jsons_count = jsons_count;
    parsed_json->jsons = jsons;
    json_object_calculate_string_length(parsed_json);
}

static void json_parse_number(const char *string, const unsigned long string_length, unsigned long byte, char *value_as_string, unsigned char *value_length) {
    unsigned long index = 0;
    for (unsigned long i = byte; i < string_length; i++) {
        const char target_character = string[i];
        switch (target_character) {
            case ',': {
                goto parsed;
                break;
            } case '-':
            case '.':
            case '0':
            case '1':
            case '2':
            case '3':
            case '4':
            case '5':
            case '6':
            case '7':
            case '8':
            case '9': {
                value_as_string[index] = target_character;
                index += 1;
                break;
            } default: {
                goto parsed;
                break;
            }
        }
    }
parsed:
    value_as_string[index] = '\0';
    *value_length = strlen(value_as_string);
}
static void json_parse_string(const char *string, const unsigned long string_length, unsigned long byte, char *parsed_string) {
    unsigned long index = 0;
    for (; byte < string_length; byte++) {
        const char target_character = string[byte];
        switch (target_character) {
            case '"': {
                goto parsed;
                break;
            } default: {
                parsed_string[index] = target_character;
                index += 1;
                break;
            }
        }
    }
parsed:
    parsed_string[index] = '\0';
    return;
}


_Bool json_object_get_boolean(const struct JSONObject *json, const char *key) {
    const unsigned long booleans_count = json->booleans_count;
    const struct JSONObjectValueBoolean *booleans = json->booleans;
    for (unsigned long i = 0; i < booleans_count; i++) {
        struct JSONObjectValueBoolean boolean = booleans[i];
        if (strcmp(key, boolean.key) == 0) {
            return boolean.value;
        }
    }
    return NULL;
}
char *json_object_get_string(const struct JSONObject *json, const char *key) {
    const unsigned long strings_count = json->strings_count;
    const struct JSONObjectValueString *strings = json->strings;
    for (unsigned long i = 0; i < strings_count; i++) {
        struct JSONObjectValueString string = strings[i];
        if (strcmp(key, string.key) == 0) {
            return string.value;
        }
    }
    return NULL;
}
static char *json_object_get_number(const struct JSONObject *json, const char *key) {
    const unsigned long numbers_count = json->numbers_count;
    const struct JSONObjectValueNumber *numbers = json->numbers;
    for (unsigned long i = 0; i < numbers_count; i++) {
        struct JSONObjectValueNumber number = numbers[i];
        if (strcmp(key, number.key) == 0) {
            return number.value;
        }
    }
    return NULL;
}
int json_object_get_integer(const struct JSONObject *json, const char *key) {
    const char *number = json_object_get_number(json, key);
    return strtol(number, NULL, 10);
}
float json_object_get_float(const struct JSONObject *json, const char *key) {
    const char *number = json_object_get_number(json, key);
    return strtof(number, NULL);
}
double json_object_get_double(const struct JSONObject *json, const char *key) {
    const char *number = json_object_get_number(json, key);
    return strtod(number, NULL);
}
void json_object_get_json(const struct JSONObject *json, const char *key, struct JSONObject *returned_json) {
    const unsigned long jsons_count = json->jsons_count;
    struct JSONObject *jsons = json->jsons;
    for (unsigned int i = 0; i < jsons_count; i++) {
        struct JSONObject target_json = jsons[i];
        if (strcmp(key, target_json.key)) {
            returned_json = &target_json;
            break;
        }
    }
}