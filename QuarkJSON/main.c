//
//  main.c
//  QuarkJSON
//
//  Created by Evan Anderson on 11/26/22.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "json_object.h"
#include "quark_json.h"

unsigned long current_time_nano(void) { // TODO: remove this
    struct timespec now;
    clock_gettime(CLOCK_REALTIME, &now);
    return now.tv_nsec;
}

void benchmark_stringify(void) {
    const unsigned long booleans_count = 300;
    struct JSONObjectValueBoolean booleans[booleans_count];
    for (unsigned long i = 0; i < booleans_count; i++) {
        const _Bool is_true = i % 3 == 0;
        char *key = is_true ? "this is a true bigboy" : "false equals zero my düd";
        const unsigned char key_length = strlen(key);
        struct JSONObjectValueBoolean value_boolean = {
            .key = key,
            .key_length = key_length,
            .value = is_true,
            .to_string_length = key_length + 3 + (is_true ? 4 : 5)
        };
        booleans[i] = value_boolean;
    }
    
    const unsigned long strings_count = 80000;
    struct JSONObjectValueString strings[strings_count];
    for (unsigned long i = 0; i < strings_count; i++) {
        const _Bool is_bro = i % 3 == 0;
        char *key = is_bro ? "okay, but who actually cares" : "really? do your Japanese learning on Duolingo!!";
        const unsigned short key_length = strlen(key);
        char *value = is_bro ? "brooooooooooooooo" : "RandomHashTags12345678";
        unsigned short value_length = strlen(value);
        struct JSONObjectValueString value_string = {
            .key = key,
            .key_length = key_length,
            .value = value,
            .value_length = value_length,
            .to_string_length = key_length + value_length + 5
        };
        strings[i] = value_string;
    }

    const unsigned long numbers_count = 1;
    struct JSONObjectValueNumber numbers[numbers_count];
    
    struct JSONObject json = {
        .booleans_count = booleans_count,
        .booleans = booleans,
        .strings_count = strings_count,
        .strings = strings,
        .numbers_count = numbers_count,
        .numbers = numbers
    };
    json_object_calculate_string_length(&json);
    
    const unsigned long to_string_length = json.to_string_length;
    char to_string[to_string_length];
    
    json_object_to_string(&json, to_string);

    //printf("%s\n", to_string);
    
    struct JSONObject parsed_json;
    struct JSONObject *parsed_json_pointer = &parsed_json;
    json_object_parse(to_string, to_string_length, parsed_json_pointer);
    char *parsed_json_to_string = malloc(to_string_length * sizeof(char));
    
    double least_bytes_per_nano = 0, most_bytes_per_nano = 0;
    for (int i = 0; i < 10; i++) {
        //clock_t now = clock();
        //json_object_to_string(parsed_json_pointer, parsed_json_to_string);
        //now = clock() - now;
        //double took_s = ((double) now) / CLOCKS_PER_SEC;
        //double took_ms = took_s * 1000;
        //double took_ns = took_ms * 1000000;
        //double bytes_per_nano = (double) to_string_length / took_ns;
        //printf("bytes=%lu, length=%lu, took %fns (%fms, gigabytes per second=%f)\n", to_string_length, strlen(parsed_json_to_string), took_ns, took_ms, bytes_per_nano);
        
        unsigned long took_ns = current_time_nano();
        json_object_to_string(parsed_json_pointer, parsed_json_to_string);
        took_ns = current_time_nano() - took_ns;
        const long double took_ms = (long double) took_ns / (long double) 1000000;
        const long double bytes_per_nano = (long double) to_string_length / (long double) took_ns;        
        if (bytes_per_nano > most_bytes_per_nano) {
            most_bytes_per_nano = bytes_per_nano;
        }
        if (least_bytes_per_nano == 0 || bytes_per_nano < least_bytes_per_nano) {
            least_bytes_per_nano = bytes_per_nano;
        }
    }
    printf("benchmark_stringify; bytes=%lu, length=%lu, least/most GB/s=%f/%f,\n", to_string_length, strlen(parsed_json_to_string), least_bytes_per_nano, most_bytes_per_nano);
    
    free(parsed_json_to_string);
    json_object_destroy(parsed_json_pointer);
}

void benchmark_parsing_from_file(void) {
    struct JSONObject parsed_json_from_file;
    
    clock_t now = clock();
    //json_object_parse_fixed_size(buffer, file_length-1, 80000, 300, 0, 0, &parsed_json_from_file);
    //json_object_parse_fixed_size_from_file("test_json_big.json", 80000, 300, 0, 0, &parsed_json_from_file);
    //json_object_parse_from_file("test_json_medium.json", &parsed_json_from_file);
    json_object_parse_from_file("test_json_api_weather_gov_fragment.json", &parsed_json_from_file);
    now = clock() - now;
    const unsigned long to_string_length = parsed_json_from_file.to_string_length;
    double took_s = ((double) now) / CLOCKS_PER_SEC;
    double took_ms = took_s * 1000;
    unsigned long took_ns = (long) (took_ms * 1000000);
    double bytes_per_milli = (double) to_string_length / took_ms;
    double megabytes_per_second = bytes_per_milli / 1000;
    
    char parsed_json_from_file_to_string[to_string_length];
    //json_object_to_string(&parsed_json_from_file, parsed_json_from_file_to_string);
    printf("benchmark_parsing_from_file; bytes=%lu, length=%lu, strings_count=%lu, took %fms (%luns, MB/s=%f [GB/s=%f])\n", to_string_length, strlen(parsed_json_from_file_to_string), parsed_json_from_file.strings_count, took_ms, took_ns, megabytes_per_second, megabytes_per_second/1000);
    //printf("%s\n", parsed_json_from_file_to_string);
    //json_object_destroy(&parsed_json_from_file); // TODO: only delete if created from heap
}

void benchmark_simd(void) {
    FILE *file = fopen("test_json_small.json", "rb");
    fseek(file, 0, SEEK_END);
    const unsigned long file_length = ftell(file);
    rewind(file);
    
    char buffer[file_length];
    fread(buffer, file_length, 1, file);
    fclose(file);

    //struct JSONObject parsed_json;
    struct QuarkJSONObject parsed_json;
    unsigned long took_ns = current_time_nano();
    //json_object_parse_fixed_size(buffer, 5369693, 80000, 300, 0, &parsed_json);
    quark_json_parse(buffer, &parsed_json);
    took_ns = current_time_nano() - took_ns;
    long double took_ms = (long double) took_ns / (long double) 1000000;
    const long double megabytes_per_second = ((long double) 5369693 / (long double) took_ns) * 1000000;
    printf("benchmark_simd; took %Lfms to parse %lu bytes (%luns, MB/s=%Lf [GB/s=%Lf], %lu booleans_count, %lu strings_count)\n", took_ms, file_length, took_ns, megabytes_per_second, megabytes_per_second/1000, parsed_json.booleans_count, parsed_json.strings_count);

    /*took_ns = current_time_nano();
    //quark_json_test_simd();
    took_ns = current_time_nano() - took_ns;
    took_ms = (long double) took_ns / (long double) 1000000;
    printf("quark_json_test_simd took %Lfms (%luns)\n", took_ms, took_ns);*/
}

int main(int argc, const char *args[]) {
    //benchmark_stringify();
    benchmark_parsing_from_file();
    //benchmark_simd();
    return 1;
}
