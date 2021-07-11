=begin
- input: a text file
  - 
- output: the longest sentence and its number of words
  - 
- explicit requirements: 
  - read the content of a text file
  - print the longest sentece in the file based on number of words.
  - sentences will end with `.`, `!`, or '?'
  - any sequence of charachters that are not spaces or sentence ending charachters is a word
  - print the number of words in the longest sentence
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====

======================

- data structure:
  - 
  
- algortihm:
  1. load a text file into the program
  2. remove new line texts
  3. split the text file by sentence endings
  4. initialize largest sentence to ''
  5. iterate through the array of sentences
    6. if the current sentence is larger than largest sentence reassign largest sentence
  7. print the largest sentce
  8. print the length of the largest sentence
  
=end

file = File.open("test.txt")
test_text = file.read


sentences = test_text.gsub("\n",' ').split(/[\.?!]/)
longest_sentence = ''

sentences.each do |sentence|
  if sentence.split.size > longest_sentence.split.size
    longest_sentence = sentence
  end
end

puts longest_sentence
puts longest_sentence.split.size