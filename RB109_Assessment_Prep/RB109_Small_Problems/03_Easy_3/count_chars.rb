=begin
- input: a string
  - 
- output: an integer
  - integer represents the number of charachters in the input string
- explicit requirements:
  - Spaces are not counted as charachters
- implicit requirements:
  - prompt user with "Please write word or multiple words: "
  - use `print` not `puts` for prompt

===== Test Cases =====
  Please write word or multiple words: walk
  There are 4 characters in "walk".
  
  Please write word or multiple words: walk, don't run
  There are 13 characters in "walk, don't run".
======================

- data structure:
  - an array of words
  
- algortihm:
  1. ask the user for words
  2. initialize `string` to the user input
  3. split `string` into an array of words to eliminate spaces
  4. sum up the length of each word
  5. initialize num_of_chars to total sum
  
=end

print "Please write word or multiple words: "
string = gets.chomp

num_of_chars = string.delete(' ').size

puts "There are #{num_of_chars} characters in \"#{string}\"."