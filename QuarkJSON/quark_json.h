
#include <smmintrin.h>
#include <immintrin.h>

void quark_json_test();


void quark_json_test() {
    const char test_json[32] = "{\"are you kidding\":\"lil' bro?\"}";
    __m128i test = _mm_setr_epi32(1, 2, 3, 4);
}