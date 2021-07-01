=begin
- input: a string
  - 
- output: a string
  - all non-alphabetic charachters replaced by spaces
- explicit requirements: 
  - if one or more non-alphabetic characters occur in a row, you should only have one space in the result (The result should never have consecutive space)
- questions: 
  - 
- implicit requirements:
  - no numbers involved

===== Test Cases =====

======================

- data structure:
  - string
  
- algortihm:
  1. replace non-alphabetic charchters with spaces
  2. remove consecutive spaces
  
=end

def cleanup(string)
  string.gsub(/([^a-z])/, ' ').squeeze(' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '