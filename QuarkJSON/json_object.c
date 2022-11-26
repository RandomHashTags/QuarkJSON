//
//  json_object.c
//  quark
//
//  Created by Evan Anderson on 11/25/22.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "json_object.h"

void json_object_destroy(struct JSONObject *json) {
    const unsigned long booleans_count = json->booleans_count;
    struct JSONObjectValueBoolean *booleans = json->booleans;
    for (unsigned long i = 0; i < booleans_count; i++) {
        struct JSONObjectValueBoolean boolean = booleans[i];
        free(boolean.key);
    }
    free(booleans);
    
    const unsigned long strings_count = json->strings_count;
    struct JSONObjectValueString *strings = json->strings;
    for (unsigned long i = 0; i < strings_count; i++) {
        struct JSONObjectValueString string = strings[i];
        free(string.key);
        free(string.value);
    }
    free(strings);
}
void json_object_calculate_string_length(struct JSONObject *json) {
    unsigned long bytes = 1;
    
    const unsigned long booleans_count = json->booleans_count;
    struct JSONObjectValueBoolean *booleans = json->booleans;
    for (unsigned long i = 0; i < booleans_count; i++) {
        struct JSONObjectValueBoolean boolean = booleans[i];
        bytes += boolean.key_length + 8 + (!boolean.value);
    }
    
    const unsigned long strings_count = json->strings_count;
    struct JSONObjectValueString *strings = json->strings;
    for (unsigned long i = 0; i < strings_count; i++) {
        struct JSONObjectValueString string = strings[i];
        bytes += string.to_string_length + 1;
    }
    
    json->to_string_length = bytes;
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
    to_string[byte-1] = '}';
    to_string[byte] = '\0';
}

void json_object_value_boolean_calculate_string_length(struct JSONObjectValueBoolean *value_boolean) {
    const unsigned char key_length = value_boolean->key_length, value_length = value_boolean->value ? 4 : 5, bytes = key_length + value_length + 3;
    value_boolean->to_string_length = bytes;
}
void json_object_value_string_calculate_string_length(struct JSONObjectValueString *value_string) {
    const unsigned char key_length = value_string->key_length, value_length = value_string->value_length, bytes = key_length + value_length + 5;
    value_string->to_string_length = bytes;
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

void json_object_parse_fixed_size(const char *string, const unsigned long string_length, const unsigned long string_count, struct JSONObject *parsed_json) {
    char *key = NULL;
    unsigned char key_length = 0;
    char string_key_array[128];
    char string_value_array[512];
    
    unsigned long booleans_count = 0;
    struct JSONObjectValueBoolean *booleans = malloc(1 * sizeof(struct JSONObjectValueBoolean));
    
    unsigned long strings_count = 0;
    struct JSONObjectValueString *strings = malloc(string_count * sizeof(struct JSONObjectValueString));
    
    //unsigned long jsons_count = 0;
    //struct JSONObject *jsons = malloc(string_count * sizeof(struct JSONObject));
    
    for (unsigned long byte = 1; byte < string_length; byte++) {
        char target_character = string[byte];
        switch (target_character) {
            case '{': {
                /*byte += 1;
                struct JSONObject target_json;
                json_object_parse_fixed_size(string, string_length, 1, &target_json);
                jsons[jsons_count] = target_json;
                jsons_count += 1;
                byte += target_json.to_string_length;*/
                break;
            } case '[': {
                break;
            } case '"': {
                byte += 1;
                json_parse_string(string, string_length, byte, string_key_array);
                key_length = strlen(string_key_array);
                char *parsed_string = malloc(key_length);
                memcpy(parsed_string, string_key_array, key_length * sizeof(char));
                key = parsed_string;
                byte += key_length;
                break;
            } case ':': {
                byte += 1;
                target_character = string[byte];
                switch (target_character) {
                    case '1': {
                        break;
                    } case 'n': {
                        break;
                    } case 't': {
                        struct JSONObjectValueBoolean value_boolean = {
                            .key = key,
                            .key_length = key_length,
                            .value = 1,
                            .to_string_length = key_length + 7
                        };
                        booleans[booleans_count] = value_boolean;
                        booleans_count += 1;
                        byte += 4;
                        break;
                    } case 'f': {
                        struct JSONObjectValueBoolean value_boolean = {
                            .key = key,
                            .key_length = key_length,
                            .value = 0,
                            .to_string_length = key_length + 8
                        };
                        booleans[booleans_count] = value_boolean;
                        booleans_count += 1;
                        byte += 5;
                        break;
                    } case '"': {
                        byte += 1;
                        json_parse_string(string, string_length, byte, string_value_array);
                        const unsigned char value_length = strlen(string_value_array);
                        char *value = malloc(value_length);
                        memcpy(value, string_value_array, value_length * sizeof(char));
                        struct JSONObjectValueString value_string = {
                            .key = key,
                            .key_length = key_length,
                            .value = value,
                            .value_length = value_length,
                        };
                        json_object_value_string_calculate_string_length(&value_string);
                        
                        strings[strings_count] = value_string;
                        strings_count += 1;
                        byte += value_length + 1;
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
    parsed_json->to_string_length = string_length;
}

void json_parse_string(const char *string, const unsigned long string_length, unsigned long byte, char *parsed_string) {
    unsigned long index = 0;
    for (unsigned long i = byte; i < string_length; i++) {
        char target_character = string[i];
        switch (target_character) {
            case '"': {
                parsed_string[index] = '\0';
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