
#pragma GCC target("avx2")

#include "quark_json.h"

void quark_json_print_char_values(__m256i vector) {
    char *values = (char *) &vector;
    printf("%c|%c|%c|%c|%c|%c|%c|%c|%c|%c|%c|%c|%c|%c|%c|%c|%c|%c|%c|%c|%c|%c|%c|%c|%c|%c|%c|%c|%c|%c|%c|%c",
                    values[0], values[1], values[2], values[3], values[4], values[5], values[6], values[7], values[8], values[9], values[10], values[11], values[12], values[13], values[14], values[15],
                    values[16], values[17], values[18], values[19], values[20], values[21], values[22], values[23], values[24], values[25], values[26], values[27], values[28], values[29], values[30], values[31]
                    );
}
void quark_json_print_int_values(__m256i vector) {
    char *values = (char *) &vector;
    printf("%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i",
                    values[0], values[1], values[2], values[3], values[4], values[5], values[6], values[7], values[8], values[9], values[10], values[11], values[12], values[13], values[14], values[15],
                    values[16], values[17], values[18], values[19], values[20], values[21], values[22], values[23], values[24], values[25], values[26], values[27], values[28], values[29], values[30], values[31]
                    );
}
void quark_json_get_characters(__m256i vector, unsigned char offset, unsigned char length, char *characters) {
    char *values = (char *) &vector;
    for (unsigned char i = offset; i < length; i++) {
        characters[i] = values[i-offset];
    }
}

__m256i quark_json_parse_block(const char *string, const unsigned long offset) {
    return _mm256_setr_epi8(string[offset], string[offset+1], string[offset+2], string[offset+3], string[offset+4], string[offset+5], string[offset+6], string[offset+7], string[offset+8], string[offset+9], string[offset+10], string[offset+11], string[offset+12], string[offset+13], string[offset+14], string[offset+15],
                            string[offset+16], string[offset+17], string[offset+18], string[offset+19], string[offset+20], string[offset+21], string[offset+22], string[offset+23], string[offset+24], string[offset+25], string[offset+26], string[offset+27], string[offset+28], string[offset+29], string[offset+30], string[offset+31]);
}

void quark_json_parse(char *string, struct QuarkJSONObject *parsed_json) {
    const unsigned long count = strlen(string), interval = 32;
    const unsigned long vector_count = (count+interval-1)/interval;

    const __m256i char_vector_quotation_marks = _mm256_set1_epi8(MARK_QUOTATION);
    const __m256i char_vector_booleans_true = _mm256_set1_epi8('t');
    const __m256i char_vector_booleans_false = _mm256_set1_epi8('f');

    const __m256i char_vector_brackets_curley_open = _mm256_set1_epi8(BRACKET_CURLEY_OPEN);
    const __m256i char_vector_brackets_curley_close = _mm256_set1_epi8(BRACKET_CURLEY_CLOSE);
    const __m256i char_vector_value_separators = _mm256_set1_epi8(VALUE_SEPARATOR);

    const __m256i char_vector_zero = _mm256_set1_epi8('0'-1);
    const __m256i char_vector_nine = _mm256_set1_epi8('9'+1);

    const __m256i char_vector_a_lower = _mm256_set1_epi8('a'-1);
    const __m256i char_vector_z_lower = _mm256_set1_epi8('z'+1);
    const __m256i char_vector_a_upper = _mm256_set1_epi8('A'-1);
    const __m256i char_vector_z_upper = _mm256_set1_epi8('Z'+1);

    const __m256i char_vector_indexes = _mm256_setr_epi8(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31);

    unsigned long keys_count = 0;
    unsigned long booleans_count = 0;

    for (unsigned long i = 0; i < vector_count; i++) {
        const unsigned long byte_offset = i * interval;
        __m256i block = quark_json_parse_block(string, byte_offset);

        __m256i quotation_marks = _mm256_cmpeq_epi8(block, char_vector_quotation_marks);

        __m256i inbetween_quotation_marks = _mm256_cmpgt_epi8(char_vector_indexes, quotation_marks);
        __m256i inbetween_quotation_marks_index = _mm256_and_si256(block, inbetween_quotation_marks);

        /*__m256i is_number = _mm256_cmpgt_epi8(block, char_vector_zero);
        __m256i is_not_number = _mm256_cmpgt_epi8(char_vector_nine, block);
        is_number = _mm256_xor_si256(is_number, is_not_number);*/

        //__m256i test = _mm256_sub_epi8(block, strings);

        printf("block=");
        quark_json_print_char_values(inbetween_quotation_marks_index);
        printf("\n");
        //strings_count += 1;

        //__m256i bruh = _mm256_and_si256(all_quotation_marks, char_vector_indexes);
        //__m256i um = _mm256_andnot_si256(block, bruh);
    }
    unsigned long strings_count = keys_count % 4;
    //printf("quark_json_parse; keys_count=%lu\n", keys_count);
    struct QuarkJSONObject json = {
        .booleans_count = booleans_count,
        .strings_count = strings_count
    };
    *parsed_json = json;
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