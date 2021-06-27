=begin
- input: a positive integer or zero
  -
- output: a string representation of the input
  -
- explicit requirements:
  - do it the old fashioned way
- implicit requirements:
  -

===== Test Cases =====
integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'
======================



- data structure:
  - an array
  
- algortihm:
  1. initialize `digits` arr to []
  2. call the loop method
    3. divide the input number by 10, reassign the input number to the division return and assign `digit` to the remainder
    4. unshift the digit on the digits array
    5. break when input number is 0
  6. map the digits array
    7. block to return strig equivalent
  8. join array of string numbers together
  
=end

I_TO_S = { 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9', 0 => '0' }

def integer_to_string(num)
  str = ''
  loop do
    num, digit = num.divmod(10)
    str.prepend(I_TO_S[digit])
    break if num == 0
  end
  str
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'