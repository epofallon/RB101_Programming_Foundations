=begin
- input: a string
- output: a new string
- explicitic rules:
  - returns a new string, not mutates the argument
  - reverse the order of the words in the string, but words remain unchanged
- implicit rules:
  - A blank string will return a blank string
  - a string of all spaces will return a blank string

- data structure:
  - reverse words... -> an array of strings, each element is a word
  
- algorithm:
  1. initialize a `result` string to the return value of:
    - calling split on the input string
    - calling reverse on the return array of calling split
    - calling join on the return value of calling reverse with a sinlge space as an argument
  2. return the result string
=end

def reverse_sentence(string)
  string.split.reverse.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''