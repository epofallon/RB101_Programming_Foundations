=begin
- input: 
  - a string argument
- output: a new string
  - hash all consecutive duplicat characters collapsed into a single charachter.
- explicit requirements: 
  - cannot use `squeeze` or `squeeze!`
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''
======================

- data structure:
  - an array of charachters
  
- algortihm:
  1. initialze `result` as an empty string
  2. split the input string into an array of characters
  3. iterate through the array of charachters using each
    4. if the current charachter is not equal to last charachter of `result`
      5. push to the end of result
  6. return `result`
  
=end

def crunch(string)
  result = ''
  
  string.chars do |char|
    result << char unless char == result[-1]
  end
  
  result
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''