=begin
- input: a string
  - 
- output: a new string
  - 
- explicit requirements: 
  - double every charachter 
- questions: 
  - 
- implicit requirements:
  - includes spaces and all types of charchters

===== Test Cases =====
repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''
======================

- data structure:
  - a string
  
- algortihm:
  1. split the string into an array of charachters
  2. iterate through the array using map
    3. double each charachter
  4. return a new string joined together
  
=end

def repeater(str)
  str.chars.map do |char|
    char * 2 
  end.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''