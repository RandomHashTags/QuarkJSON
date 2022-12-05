# QuarkJSON
Native C JSON parser, emphasized on performance and system resource efficiency.
- !!!!!   right now the parser only parses booleans, strings, numbers, and JSONObjects   !!!!!

## Etymology
QuarkJSON's name is heavily influenced by the subatomic particle; the Quark makes up every _thing_. JSON pretty much makes up everything on server API's.

## Philosophy
Maximize performance and efficiency to the point in which the CPU is no longer the bottleneck.

## Performance / Benchmarks
machine:
- iMac 2019
- CPU: 3.6GHz 8-core i9
- RAM: 72GB 2667 MHz DDR4
- SSD: 2TB
- macOS: 13.0.1

compiler:
- Apple clang version 14.0.0 (clang-1400.0.29.202)
- Target: x86_64-apple-darwin22.1.0
- Thread model: posix
- with -03 flag

file:
- test_json_big.json
### Parsing
- speed: ~500-760 MB/s
- RAM used: 13.74 MiB (14.40743 MB)
### Stringify
- ~2-6 GB/s
  
**OFFICIAL BENCHMARKS WILL BE MORE ACCURATE AND WELL DOCUMENTED WHEN THE PARSER IS OUT OF BETA**

### Future
- [ ] usable json parser
- [ ] preserve order
- [ ] keep `null` value keys
- [ ] use SIMD or similar cpu instruction for better performance
- [ ] support Minify
- [ ] support Prettify
- [ ] support Validation

## Usage
- TODO

## License
Public Domain. Creative Commons Zero v1.0 Universal.