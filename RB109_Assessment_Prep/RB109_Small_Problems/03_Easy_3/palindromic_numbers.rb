=begin
- input:
  - an integer
- output:
  - `true` if an integer argument is palindromic, `false` otherwise
- explicit requirements:
  - a palindromic number reads the same forwards and backwards
- implicit requirements:
  - single digit numbers are palindromic
  - 

===== Test Cases =====
palindromic_number?(34543) == true
palindromic_number?(123210) == false
palindromic_number?(22) == true
palindromic_number?(5) == true
======================

- data structure:
  - a string will be great for thsi
  
- algortihm:
  1. initialize `str` to the return value of invoking the `to_s` method on the input integer
  2. check if the string that `str` references is equal to the return value of calling `reverse` on it
  
=end

def palindromic_number?(num)
  str = num.to_s
  str == str.reverse
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true