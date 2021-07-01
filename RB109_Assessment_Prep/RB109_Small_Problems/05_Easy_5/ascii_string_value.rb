=begin
- input: a string
  -
- output: an integer
  - is the ASCII string value of the input string
    - ASCII string value is the sum of the ASCII values of every charachter in the string
- explicit requirements:
  - 
- questions:
  - 
- implicit requirements:
  - an empty string will return the 0

===== Test Cases =====
ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0
======================

- data structure:
  - split the string into charachters
  - iterate through the array of charachters
    - sum the ASCII values of each string
  
- algortihm:
  1.
  
=end

def ascii_value(str)
  str.chars.map(&:ord).sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0