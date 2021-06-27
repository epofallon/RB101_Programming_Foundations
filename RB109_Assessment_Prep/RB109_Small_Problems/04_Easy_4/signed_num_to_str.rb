=begin
- input:
  - an integer
- output:
  - a string representation of the input integer
- explicit requirements:
  - add the ability to represent negative numbers
  - can use `integer_to_string` from previous exercise
- implicit requirements:
  - a number greater than zero will have a '+' prepended on
  - a number less than zero will have a '-' prepended on
  - zero will get neither '+' or '-'

===== Test Cases =====
signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'
======================

- data structure:
  - strings and integers
  
- algortihm:
  1. if input integer is greater than 0
    2. initialize sign to '+'
  3. if the input integer is less than 0
    4. initialize sign to '-'
  5. else call integer_to_string(num)
  6. call integer_to_string(abs(num)) and prepend sign
  
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

def signed_integer_to_string(num)
  sign = case num <=> 0
         when  1 then '+'
         when -1 then '-'
         else ''
         end
  
  "#{sign}#{integer_to_string(num.abs)}"
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'