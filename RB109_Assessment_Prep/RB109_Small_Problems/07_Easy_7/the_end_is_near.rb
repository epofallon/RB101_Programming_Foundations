=begin
- input: a string
  - 
- output: a string
  - the second to last word in the input string
- explicit requirements: 
  - input string will always have at least two words
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'
======================

- data structure:
  - an array of words
  
- algortihm:
  1. split the string into an array of words
  2. grab the word at index arr.length / 2 + 1 if odd
  3. grab the word at index arr.lenth / 2 && arr.size / 2 + 1 if even
  4. return '' if arr.size is 0
  
=end

def penultimate(str)
  words = str.split
  
  case 
  when words.size == 0 then ''
  when words.size.odd? then words[(words.size / 2)]
  else [words[(words.size / 2) -1 ], words[(words.size / 2)]].join(' ')
  end
end

p penultimate('last word') #== 'last word'
p penultimate('the last word') #== 'last'
p penultimate('The Launch School is great!') #== 'School is'