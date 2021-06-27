=begin
- input:
  - a string of digits with either a '+', '-' or '' as a starting symbol
- output:
  - a positive or negative integer
- explicit requirements:
  - do it the manual way
- implicit requirements:
  -

===== Test Cases =====
string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100
======================

- data structure:
  - 
  
- algortihm:
  1.
  
=end

S_TO_I = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9}

def string_to_integer(str)
  digits = str.chars.map{ |char| S_TO_I[char]}.reduce { |value, digit| 10 * value + digit }
end

def string_to_signed_integer(str)
  sign = str[0] == '-' ? -1 : 1
  string_to_integer(str.delete('+-')) * sign
end
p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100