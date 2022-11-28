
#include <smmintrin.h>
#include <immintrin.h>

#define OPEN_BRACKET '{'

void quark_json_print(__m128i vector);
void quark_json_test();


void quark_json_print(__m128i vector) {
    uint8_t values[16];
    memcpy(values, &vector, sizeof(values));
    printf("quark_json_print; %c, %c, %c, %c, %c, %c, %c, %c, %c, %c, %c, %c, %c, %c, %c, %c\n", values[0], values[1], values[2], values[3], values[4], values[5], values[6], values[7], values[8], values[9], values[10], values[11], values[12], values[13], values[14], values[15]);
}

void quark_json_test() {
    const unsigned long count = 32, interval = 16, remainder = count % interval;
    const unsigned long corrected_count = count + (remainder > 0 ? interval - remainder : 0);
    const unsigned long vector_count = corrected_count/interval;
    __m128i vectors[vector_count];

    const char test_json[count] = "{\"are you kidding\":\"lil' bro?\"}";
    for (unsigned long i = 0; i < corrected_count; i += interval) {
        __m128i bro = _mm_setr_epi8(test_json[i], test_json[i+1], test_json[i+2], test_json[i+3], test_json[i+4], test_json[i+5], test_json[i+6], test_json[i+7], test_json[i+8], test_json[i+9], test_json[i+10], test_json[i+11], test_json[i+12], test_json[i+13], test_json[i+14], test_json[i+15]);
        vectors[i / interval] = bro;
    }
    for (unsigned long i = 0; i < vector_count; i++) {
        __m128i test = vectors[i];
        quark_json_print(test);
    }
}

void quark_json_get_indexes_for_character(char character, __m128i vector, char *indexes_count, char *indexes) {
}