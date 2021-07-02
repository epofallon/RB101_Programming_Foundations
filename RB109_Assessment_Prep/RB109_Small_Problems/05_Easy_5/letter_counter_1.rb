=begin
- input: a string
  - has one or more space seperated words
- output: a hash
  - the number of words of different sizes
- explicit requirements: 
  - words consist of any string characters that do not include space
- questions: 
  - 
- implicit requirements:
  - hash keys are the word lengths
  - hash values are the number of words

===== Test Cases =====
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
======================

- data structure:
  - an array of words
  - a hash to return
  
- algortihm:
  1. initialize num_word_lengths as an empty hash with a default value of 0
  2. split the string into an array of words
  3. iterate through the array of words
    4. increment the hash value by 1 where the hash key is the length of the current word
  5. return num_word_lengths hash
  
=end

def word_sizes(string)
  num_word_lengths = Hash.new(0)
  string.split.each do |word|
    num_word_lengths[word.gsub(/([^a-zA-Z])/, '').size] += 1
  end
  
  num_word_lengths
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}