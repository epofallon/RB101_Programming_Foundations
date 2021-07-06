=begin
- input: two integers
  - the first is the number to rotate
  - the second is the number of digits from the end that get rotated
- output: 
  - 
- explicit requirements: 
  - inputting one returns the original number (one digit rotates only itself)
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917
======================

- data structure:
  - an array of single digit strings
  
- algortihm:
  1. convert the integer to an array of digits
  2. slice out the digits that will get rotated from the negative of the input to -1
  3. call rotate_array on the sliced out digits
  4. concat together the unsliced portion (from 0 to -input exclusive)
  5. convert the array back to an integer
  
=end
def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_rightmost_digits(num, r_digits)
  digits = num.to_s.chars
  digits[-r_digits..-1] = rotate_array(digits[-r_digits..-1])
  digits.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917