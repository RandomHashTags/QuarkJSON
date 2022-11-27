//
//  json_object.h
//  quark
//
//  Created by Evan Anderson on 11/25/22.
//

#ifndef json_object_h
#define json_object_h

#include <stdio.h>

struct JSONObject {
    unsigned long booleans_count;
    struct JSONObjectValueBoolean *booleans;
    
    unsigned long strings_count;
    struct JSONObjectValueString *strings;

    unsigned long numbers_count;
    struct JSONObjectValueNumber *numbers;
    
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
    unsigned char value_length;
    unsigned short to_string_length;
};

enum JSONObjectValueNumberType {
    JSON_OBJECT_VALUE_NUMBER_TYPE_INTEGER,
    JSON_OBJECT_VALUE_NUMBER_TYPE_FLOAT,
    JSON_OBJECT_VALUE_NUMBER_TYPE_DOUBLE,
};

struct JSONObjectValueNumber {
    char *key;
    unsigned char key_length;
    char *value;
    unsigned char value_length;
    unsigned short to_string_length;
};

void json_object_destroy(struct JSONObject *json);
void json_object_calculate_string_length(struct JSONObject *json);
void json_object_to_string(struct JSONObject *json, char *to_string);

void json_object_value_boolean_calculate_string_length(struct JSONObjectValueBoolean *value_boolean);
void json_object_value_string_calculate_string_length(struct JSONObjectValueString *value_string);

void json_object_value_boolean_to_string(struct JSONObjectValueBoolean *value_boolean, char *to_string);
void json_object_value_string_to_string(struct JSONObjectValueString *value_string, char *to_string);
void json_object_value_number_to_string(struct JSONObjectValueNumber *value_number, char *to_string);

void json_object_parse_fixed_size_from_file(const char *file_path, const unsigned long string_count, const unsigned long boolean_count, const unsigned long number_count, struct JSONObject *parsed_json);
void json_object_parse_fixed_size(const char *string, const unsigned long string_length, const unsigned long string_count, const unsigned long boolean_count, const unsigned long number_count, struct JSONObject *parsed_json);

void json_parse_number(const char *string, const unsigned long string_length, unsigned long byte, char *value_as_string, unsigned char *value_length);
void json_parse_string(const char *string, const unsigned long string_length, unsigned long byte, char *parsed_string);

_Bool json_object_get_boolean(const struct JSONObject *json, const char *key);
char *json_object_get_string(const struct JSONObject *json, const char *key);

#endif /* json_object_h */
