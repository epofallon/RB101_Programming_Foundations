=begin
- input: string
  - 
- output: boolean
  - true if the string is uppercased
  - false otherwise
- explicit requirements: 
  - 
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====

======================

- data structure:
  - string
  
- algortihm:
  1. check to see if string is equivalent to calling uppercase on it
  
=end

def uppercase?(str)
  str == str.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true