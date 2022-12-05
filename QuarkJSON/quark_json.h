
#include <immintrin.h>
#include <string.h>
#include "json_object.h"

#define BRACKET_CURLEY_OPEN '{'
#define BRACKET_CURLEY_CLOSE '}'
#define BRACKET_SQUARE_OPEN '['
#define BRACKET_SQUARE_CLOSE ']'
#define MARK_QUOTATION '"'
#define VALUE_SEPARATOR ':'
#define COMMA ','

struct QuarkJSONTest {

};

enum QuarkJSONTestValueType {
    QUARK_JSON_TEST_VALUE_TYPE_STRING,
    QUARK_JSON_TEST_VALUE_TYPE_BOOLEAN
};

struct QuarkJSONObject {
    unsigned long booleans_count;
    unsigned long strings_count;
};

struct QuarkJSONBlock {
    char string[33];
    __m256i block;
};

void quark_json_print_char_values(__m256i vector);
void quark_json_print_int_values(__m256i vector);
void quark_json_get_characters(__m256i vector, unsigned char offset, unsigned char length, char *characters);
__m256i quark_json_parse_block(const char *string, const unsigned long offset);

void quark_json_parse(char *string, struct QuarkJSONObject *parsed_json);

void quark_json_stringify(struct QuarkJSONObject *json);