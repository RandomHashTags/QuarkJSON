
#include "quark_json.h"

void quark_json_print(__m256i vector) {
    uint8_t values[32];
    memcpy(values, &vector, sizeof(values));
    printf("%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i",
                    values[0], values[1], values[2], values[3], values[4], values[5], values[6], values[7], values[8], values[9], values[10], values[11], values[12], values[13], values[14], values[15],
                    values[16], values[17], values[18], values[19], values[20], values[21], values[22], values[23], values[24], values[25], values[26], values[27], values[28], values[29], values[30], values[31]
                    );
}
void quark_json_get_characters(__m256i vector, unsigned char offset, unsigned char length, char *characters) {
    uint8_t values[32];
    memcpy(values, &vector, sizeof(values));
    for (unsigned char i = offset; i < length; i++) {
        characters[i] = values[i-offset];
    }
}

__m256i quark_json_parse_block(const char *string, const unsigned char offset, char *string_block) {
    for (unsigned char i = offset; i < offset+32; i++) {
        string_block[i-offset] = string[i];
    }
    string_block[32] = '\0';
    return _mm256_setr_epi8(string[offset], string[offset+1], string[offset+2], string[offset+3], string[offset+4], string[offset+5], string[offset+6], string[offset+7], string[offset+8], string[offset+9], string[offset+10], string[offset+11], string[offset+12], string[offset+13], string[offset+14], string[offset+15],
                            string[offset+16], string[offset+17], string[offset+18], string[offset+19], string[offset+20], string[offset+21], string[offset+22], string[offset+23], string[offset+24], string[offset+25], string[offset+26], string[offset+27], string[offset+28], string[offset+29], string[offset+30], string[offset+31]);
}

void quark_json_parse(char *string) {
    const unsigned long count = strlen(string), interval = 32, remainder = count % interval;
    const unsigned long corrected_count = count + (remainder > 0 ? interval - remainder : 0);
    const unsigned long vector_count = corrected_count/interval;

    const __m256i char_vector_quotation_marks = _mm256_set1_epi8(MARK_QUOTATION);
    const __m256i char_vector_booleans_true = _mm256_set1_epi8('t');
    const __m256i char_vector_booleans_false = _mm256_set1_epi8('f');

    const __m256i char_vector_brackets_curley_open = _mm256_set1_epi8(BRACKET_CURLEY_OPEN);
    const __m256i char_vector_brackets_curley_close = _mm256_set1_epi8(BRACKET_CURLEY_CLOSE);
    const __m256i char_vector_value_separators = _mm256_set1_epi8(VALUE_SEPARATOR);
    const __m256i char_vector_commas = _mm256_set1_epi8(COMMA);

    __m256i blocks[vector_count];
    __m256i quotation_mark_registers[vector_count];
    __m256i value_separator_registers[vector_count];
    for (unsigned long i = 0; i < vector_count; i++) {
        const unsigned long byte_offset = i * interval;
        char string_block[33];
        __m256i block = quark_json_parse_block(string, byte_offset, string_block);
        blocks[i] = block;

        quotation_mark_registers[i] = _mm256_cmpeq_epi8(block, char_vector_quotation_marks);
        value_separator_registers[i] = _mm256_cmpeq_epi8(block, char_vector_value_separators);

        __m256i strings_test = _mm256_add_epi8(quotation_mark_registers[i], value_separator_registers[i]);
        quark_json_print(strings_test);
        printf("\n");
    }
    unsigned long booleans_count = 0, strings_count = 0;
    _Bool check_previous_vector = 0;
    for (unsigned long i = 0; i < vector_count; i++) {
        __m256i block = blocks[i];
        //__m256i brackets_curley_open = _mm256_cmpeq_epi8(block, char_vector_brackets_curley_open);
        //__m256i booleans_true = _mm256_cmpeq_epi8(block, char_vector_booleans_true);

        //__m256i booleans_false = _mm256_cmpeq_epi8(block, char_vector_booleans_false);

        //__m256i value_separators = _mm256_cmpeq_epi8(block, char_vector_value_separators);

        //__m256i strings_test = _mm256_or_si256(quotation_marks, value_separators);
        //__m256i booleans_true_test = _mm256_or_si256(value_separators, booleans_true);
        //__m256i booleans_false_test = _mm256_or_si256(value_separators, booleans_false);
        //__m256i jsons_test = _mm256_or_si256(value_separators, brackets_curley_open);
        //const int has_boolean_true = _mm256_testnzc_si256(value_separators, booleans_true); // TODO: fix dis
        //printf("quark_json_print booleans_true_test - offset=%lu, has_boolean_true=%d\njson_block string=%s\n", byte_offset, has_boolean_true, json_block.string);
        //quark_json_print(booleans_true_test);
    }

    printf("booleans_count=%lu, strings_count=%lu\n", booleans_count, strings_count);
}

void quark_json_stringify(struct QuarkJSONObject *json) {
    char to_string[100000];
    to_string[0] = '{';

    unsigned long byte = 1;

    /*const unsigned long booleans_count = json->booleans_count;
    struct QuarkJSONObjectValueBoolean *booleans = json->booleans;
    for (unsigned long i = 0; i < booleans_count; i++) {
        struct QuarkJSONObjectValueBoolean boolean = booleans[i];
        const unsigned char key_length = boolean.key_length;
        char to_key[key_length+3];
        quark_json_get_characters(boolean.key, 1, key_length, to_key);
    }
    to_string[byte] = '\0';
    printf("quark_json_stringify; to_string=%s\n", to_string);*/
}