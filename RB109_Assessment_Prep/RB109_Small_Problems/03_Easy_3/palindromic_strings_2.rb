=begin
- input:
  - a string
- output:
  - `true` if the input string is a palidrome, `false` otherwise
- explicit requirements:
  - case-insensitive
  - ignore all non-alphanumeric charachters
    - commas, apostraphes, spaces, periods...
- implicit requirements:
  -

===== Test Cases =====
real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false
======================

- data structure:
  - a string
  
- algortihm:
  1. initialze alphanumeric_str to input string with all non-alphanumeric charachters removed
  2. call palilndrome? on alphanumeric_str
  
=end

def palindrome?(str)
  str == str.reverse
end

def real_palindrome?(str)
  alphanumeric_str = str.gsub(/[^(a-z)^(A-Z)^(0-9)]/, '')
  palindrome?(alphanumeric_str.downcase)
end


p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false