//
//  json_object.h
//  quark
//
//  Created by Evan Anderson on 11/25/22.
//

#ifndef json_object_h
#define json_object_h

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <fcntl.h>
#include <assert.h>
#include <unistd.h>

#define JSON_MAXIMUM_STRING_VALUE_LENGTH 1100

struct JSONObject {
    _Bool has_key;
    unsigned char key_length;
    char *key;

    unsigned long booleans_count;
    struct JSONObjectValueBoolean *booleans;
    
    unsigned long strings_count;
    struct JSONObjectValueString *strings;

    unsigned long numbers_count;
    struct JSONObjectValueNumber *numbers;

    unsigned long jsons_count;
    struct JSONObject *jsons;

    unsigned long arrays_count;
    struct JSONArray *arrays;
    
    unsigned long to_string_length;
};

struct JSONObjectValueBoolean {
    char *key;
    unsigned char key_length;
    _Bool value;
    unsigned short to_string_length;
};

struct JSONObjectValueString {
    char *key;
    unsigned char key_length;
    char *value;
    unsigned short value_length;
    unsigned short to_string_length;
};

struct JSONObjectValueNumber {
    char *key;
    unsigned char key_length;
    char *value;
    unsigned char value_length;
    unsigned short to_string_length;
};

enum JSONArrayValueType {
    JSON_ARRAY_VALUE_TYPE_STRINGS,
    JSON_ARRAY_VALUE_TYPE_BOOLEANS,
    JSON_ARRAY_VALUE_TYPE_NUMBERS,
    JSON_ARRAY_VALUE_TYPE_JSON_OBJECTS,
    JSON_ARRAY_VALUE_TYPE_JSON_ARRAYS
};

struct JSONArray {
    _Bool has_key;
    unsigned char key_length;
    char *key;

    enum JSONArrayValueType type;
    unsigned long value_count;
    union {
        _Bool *booleans;
        struct JSONArrayValueString *strings;
        struct JSONArrayValueNumber *numbers;
        struct JSONObject *jsons;
        struct JSONArray *arrays;
    };

    unsigned long to_string_length;
};
struct JSONArrayValueString {
    char *string;
    unsigned short string_length;
};
struct JSONArrayValueNumber {
    char *number;
    unsigned char number_length;
};


/*
    JSONObject functionality
*/

void json_object_destroy(struct JSONObject *json);
static void json_object_destroy_heap_elements(const unsigned long booleans_count, struct JSONObjectValueBoolean *booleans, const unsigned long strings_count, struct JSONObjectValueString *strings, const unsigned long numbers_count, struct JSONObjectValueNumber *numbers, const unsigned long jsons_count, struct JSONObject *jsons);
static void json_object_destroy_stack_elements(const unsigned long booleans_count, struct JSONObjectValueBoolean *booleans, const unsigned long strings_count, struct JSONObjectValueString *strings, const unsigned long numbers_count, struct JSONObjectValueNumber *numbers, const unsigned long jsons_count, struct JSONObject *jsons);

void json_object_calculate_string_length(struct JSONObject *json);
void json_object_to_string(struct JSONObject *json, char *to_string);

void json_object_value_create_boolean(char *key, unsigned char key_length, _Bool value, struct JSONObjectValueBoolean *boolean);
void json_object_value_create_string(char *key, unsigned char key_length, char *value, unsigned short value_length, struct JSONObjectValueString *string);
void json_object_value_create_number(char *key, unsigned char key_length, char *value, unsigned char value_length, struct JSONObjectValueNumber *number);

void json_object_value_boolean_to_string(struct JSONObjectValueBoolean *value_boolean, char *to_string);
void json_object_value_string_to_string(struct JSONObjectValueString *value_string, char *to_string);
void json_object_value_number_to_string(struct JSONObjectValueNumber *value_number, char *to_string);

void json_object_parse_from_file(const char *file_path, struct JSONObject *parsed_json);
void json_object_parse_fixed_size_from_file(const char *file_path, const unsigned long string_count, const unsigned long boolean_count, const unsigned long number_count, const unsigned long json_count, const unsigned long array_count, struct JSONObject *parsed_json);

void json_object_parse(const char *string, const unsigned long string_length, struct JSONObject *parsed_json);
static void json_object_parse_starting_at(unsigned long byte, const char *string, const unsigned long string_length, struct JSONObject *parsed_json);
void json_object_parse_fixed_size(const char *string, const unsigned long string_length, const unsigned long string_count, const unsigned long boolean_count, const unsigned long number_count, const unsigned long json_count, const unsigned long array_count, struct JSONObject *parsed_json);
static void json_object_parse_fixed_size_starting_at(unsigned long byte, const char *string, const unsigned long string_length, const unsigned long string_count, const unsigned long boolean_count, const unsigned long number_count, const unsigned long json_count, const unsigned long array_count, struct JSONObject *parsed_json);

_Bool json_object_get_boolean(const struct JSONObject *json, const char *key);
char *json_object_get_string(const struct JSONObject *json, const char *key);
static char *json_object_get_number(const struct JSONObject *json, const char *key);
int json_object_get_integer(const struct JSONObject *json, const char *key);
float json_object_get_float(const struct JSONObject *json, const char *key);
double json_object_get_double(const struct JSONObject *json, const char *key);
void json_object_get_json(const struct JSONObject *json, const char *key, struct JSONObject *returned_json);

/*
    JSONArray functionality
*/

void json_array_calculate_string_length(struct JSONArray *array);
void json_array_to_string(struct JSONArray *array, char *to_string);

void json_array_parse_from_file(const char *file_path, struct JSONArray *parsed_array);
void json_array_parse_fixed_size_from_file(const char *file_path, const unsigned long value_count, struct JSONArray *parsed_array);

void json_array_parse(const char *string, const unsigned long string_length, struct JSONArray *parsed_array);
static void json_array_parse_starting_at(unsigned long byte, const char *string, const unsigned long string_length, struct JSONArray *parsed_array);
void json_array_parse_fixed_size(const char *string, const unsigned long string_length, const unsigned long value_count, struct JSONArray *parsed_array);
static void json_array_parse_fixed_size_starting_at(unsigned long byte, const char *string, const unsigned long string_length, const unsigned long value_count, struct JSONArray *parsed_array);

/*
    JSON functionality
*/
static void json_parse_number(const char *string, const unsigned long string_length, unsigned long byte, char *value_as_string, unsigned char *value_length);
static void json_parse_string(const char *string, const unsigned long string_length, unsigned long byte, char *parsed_string);

#endif /* json_object_h */
