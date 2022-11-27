# QuarkJSON
Native C JSON parser, emphasized on performance and system resource efficiency.
- !!!!!   right now the parser only parses booleans, strings, and numbers   !!!!!

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
initial benchmarking suggests ~2-6 GB/s - a 5.36MB (5359993 bytes) _string only key-value_ JSON can take less than a millisecond (0.890000ms, or 6.022464 GB/s)
- obviously there are more than 1 data type to be parsed, not just strings
  
**OFFICIAL BENCHMARKS WILL BE MORE ACCURATE AND DOCUMENTED WHEN THE PARSER IS OUT OF BETA**

### Future
- use SIMD or similar cpu instruction for better performance

## Usage
- TODO

## License
Creative Commons Zero v1.0 Universal. AKA, public domain. I chose this license because I enjoy sharing knowledge.