=begin
- input:
  - a string
- output:
  - `true` if the input string is a palindrome, `false` otherwise
- explicit requirements:
  - A palindrome reads forewards and backwards the same
  - lettercase matters
  - punctuation matters
  - spaces matter
- implicit requirements:
  -

===== Test Cases =====
palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true
======================

- data structure:
  -
  
- algortihm:
  1. check if string is equal to its reverse
  
=end

def palindrome?(str)
  str == str.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

p palindrome?([3, 5, 6, 6, 4, 3])