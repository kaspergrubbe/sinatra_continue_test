require 'benchmark'

# 800 byte file
`rm -f test_file_800`
`base64 /dev/random | dd of=test_file_800 bs=800 count=$((1 * 1))`

# 1kb file
`rm -f test_file_1kb`
`base64 /dev/random | dd of=test_file_1kb bs=1024 count=$((1 * 1))`

# 15 kb file
`rm -f test_file_15kb`
`base64 /dev/random | dd of=test_file_15kb bs=1024 count=$((1 * 15))`

def request(filename, params)
  request = `test_file=\`cat #{filename}\` && curl #{params} -id \"a=$test_file\" 'localhost:3001/foo'`
end

Benchmark.bm(100) do |x|
  x.report("800b") { request("test_file_800",  "--silent") }
  x.report("1Kb ") { request("test_file_1kb",  "--silent") }
  x.report("15Kb") { request("test_file_15kb", "--silent") }
end

