=begin
- input: a positive integer, another integer that is either 1 or 0
- output: a string
  - alternating 1s and 0s of the length of the given integer
  
- explicit rules:
  - string will always start with ones
  - length of string will match the given integer
- implicit rules:
  - the integer 0 will return an empty string

- data structure:
  - a string

- algorithm:
  1. initialize a `result` variable to an empty string
   - when the second parameter `start_num` is equal to `1` set `second_num` to '0'
   - when the second parameter `start_num` is equal to `0` set `second_num` to `1`
  2. iterate the input integer number of times
    A. On an odd iteration, add the integer `start_num` references to the result string
    B. On an even iteration, add the integer `second_num` references to the result string
  3. Return the `result` string
  
=end

def stringy(num, start_num=1)
  result = ''
  start_num = start_num.to_s
  second_num = start_num == '1' ? '0' : '1'
  num.times { |int| result << (int.even? ? start_num : second_num) }
  result
end

puts stringy(6, 2) #== '101010'
puts stringy(6) #== '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'