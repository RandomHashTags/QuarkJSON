
#include "quark_json.h"

void quark_json_print(__m256i vector) {
    uint8_t values[32];
    memcpy(values, &vector, sizeof(values));
    printf("quark_json_print; %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i\n",
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

__m256i quark_json_get_character_vector(char character) {
    return _mm256_set_epi8(character, character, character, character, character, character, character, character, character, character, character, character, character, character, character, character,
                                                character, character, character, character, character, character, character, character, character, character, character, character, character, character, character, character);
}

void quark_json_test_parser(void) {
    const char *test_json = "{\"are you kidding me brotato chip in dip!\":\"lil' bro123456789o?\"}";
    const unsigned long count = strlen(test_json), interval = 32, remainder = count % interval;
    const unsigned long corrected_count = count + (remainder > 0 ? interval - remainder : 0);
    const unsigned long vector_count = corrected_count/interval;
    __m256i vectors[vector_count];

    __m256i quotation_marks = quark_json_get_character_vector(MARK_QUOTATION);
    __m256i bracket_curley_close = quark_json_get_character_vector(BRACKET_CURLEY_CLOSE);

    for (unsigned long i = 0; i < corrected_count; i += interval) {
        __m256i bro = _mm256_setr_epi8(test_json[i], test_json[i+1], test_json[i+2], test_json[i+3], test_json[i+4], test_json[i+5], test_json[i+6], test_json[i+7], test_json[i+8], test_json[i+9], test_json[i+10], test_json[i+11], test_json[i+12], test_json[i+13], test_json[i+14], test_json[i+15],
                                    test_json[i+16], test_json[i+17], test_json[i+18], test_json[i+19], test_json[i+20], test_json[i+21], test_json[i+22], test_json[i+23], test_json[i+24], test_json[i+25], test_json[i+26], test_json[i+27], test_json[i+28], test_json[i+29], test_json[i+30], test_json[i+31]);
        vectors[i / interval] = bro;
    }
    for (unsigned long i = 0; i < vector_count; i++) {
        __m256i vector = vectors[i];
        __m256i bro1 = _mm256_cmpeq_epi8(vector, quotation_marks);
        printf("character=\", ");
        quark_json_print(bro1);

        __m256i bro2 = _mm256_cmpeq_epi8(vector, bracket_curley_close);
        printf("character=}, ");
        quark_json_print(bro2);
    }
}

void quark_json_test_stringify(struct QuarkJSONObject *json) {
    char to_string[100000];
    to_string[0] = '{';

    unsigned long byte = 1;

    const unsigned long booleans_count = json->booleans_count;
    struct QuarkJSONObjectValueBoolean *booleans = json->booleans;
    for (unsigned long i = 0; i < booleans_count; i++) {
        struct QuarkJSONObjectValueBoolean boolean = booleans[i];
        const unsigned char key_length = boolean.key_length;
        char to_key[key_length+3];
        quark_json_get_characters(boolean.key, 1, key_length, to_key);
    }
    to_string[byte] = '\0';
    printf("quark_json_test_stringify; to_string=%s\n", to_string);
}