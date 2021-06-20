=begin
  input: a positive integer
  output: an array of the digits in the number
  explicit requirements:
  - output array contains integers representing the digits of the input integer
  implicit requirements:
  - integers representing digits are in correct order
  - no need to account for invalid inputs
 
  3        7       5     2   9  0
  100,000  10,000  1,000 100 10 1  
  puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
  puts digit_list(7) == [7]                     # => true
  puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
  puts digit_list(444) == [4, 4, 4]             # => true
  
  Data Structure: An array
  
  1. convert integer to a string
  2. split string into charachters array
  3. loop through elements of charachter array
    - convert each charachter back to an integer
    
  1. initialize a `result` array
  - begin loop
  2. divide the input integer by 10
  3. add the remainder to the front of the array
  4. reassign the result of the division to the integer
  - break when the integer assigned to `num` is 0
  5. return the result array
=end

def digit_list(num)
  # num.to_s.chars.map(&:to_i)
  result = []
  loop do
    num, remainder = num.divmod(10)
    result.unshift(remainder)
    break if num == 0
  end
  result
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true