
#include <smmintrin.h>
#include <nmmintrin.h>
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

struct QuarkJSONObject {
};

struct QuarkJSONBlock {
    char string[33];
    __m256i block;
};

void quark_json_print(__m256i vector);
void quark_json_get_characters(__m256i vector, unsigned char offset, unsigned char length, char *characters);
__m256i quark_json_parse_block(const char *string, const unsigned char offset, char *string_block);

void quark_json_parse(char *string);

void quark_json_stringify(struct QuarkJSONObject *json);