=begin
- input: a string
  - 
- output: a string
  - the middle charachter or charachters of the string
  - 1 char if odd length
  - 2 chars if even length
- explicit requirements: 
  - 
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
center_of('I love ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'
======================

- data structure:
  - string
  
- algortihm:
  1. if the string length is odd
    2. slice at the index length / 2
  3. if the string length is even
    4. slice at the index length / 2 - 1 with length 2
  
  'world' --> 5
   01234 --> 2
   for odd it is length / 2
  
  'annual' --> 6
   012345 --> 2,3
   for even it is length / 2 minus 1 and length / 2
=end

def center_of(str)
  start_idx, length =  str.size.odd? ? [str.size / 2, 1] : [(str.size / 2) - 1, 2]
  str[start_idx, length]
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'