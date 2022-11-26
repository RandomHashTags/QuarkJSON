# QuarkJSON
Native C JSON parser, emphasized on performance and system resource efficiency.
- !! right now the parser only parses booleans and strings !!

## Etymology
QuarkJSON's name is heavily influenced by the subatomic particle; the Quark makes up every _thing_. JSON pretty much makes up everything on server API's.

## Philosophy
- Maximize performance and efficiency to the point in which the CPU is no longer the bottleneck

## Performance / Benchmarks
with initial benchmarking, parsing a 5.3MB (5359993 bytes) _string only key-value_ JSON takes less than a millisecond (0.945000ms, or 5.671950 gigabytes-per-second)
- obviously there are more than 1 data type to be parsed, not just strings
  
**OFFICIAL BENCHMARKS WILL BE MORE ACCURATE AND DOCUMENTED WHEN THE PARSER IS OUT OF BETA**

## Usage
- TODO

## License
Creative Commons Zero v1.0 Universal. AKA, public domain. I chose this license because I enjoy sharing knowledge.
