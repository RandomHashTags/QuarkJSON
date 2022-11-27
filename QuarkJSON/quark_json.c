//
//  quark_json.c
//  quark
//
//  Created by Evan Anderson on 11/26/22.
//

#include "quark_json.h"

void print_m128i(const __m128i variable) {
    uint16_t values[8];
    memcpy(values, &variable, sizeof(values));
}

void quark_json_test(void) {
    __m128i test1 = _mm_set_epi32(100, 200, 300, 400);
    __m128i test2 = _mm_set_epi32(400, 300, 200, 100);
    __m128i test3 = _mm_add_epi32(test1, test2);
    print_m128i(test3);
}