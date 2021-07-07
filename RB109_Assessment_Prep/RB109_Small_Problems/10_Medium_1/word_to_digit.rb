=begin
- input: a string sentence
  - 
- output: the same string
  - numbers changed to their digit form
- explicit requirements: 
  - 
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
======================

- data structure:
  - string
  
- algortihm:
  1. initiate a hash with keys being the spelling of numbers and numbers being their value
  2. iterate through the keys of the hash
    3. call gsub! on the string and pass in key and the hash
  
=end
DIGITS ={ 'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4', 'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'}

def word_to_digit(sentence)
  DIGITS.each_key do |word|
    sentence.gsub!(/\b#{word}\b/i, DIGITS)
  end
  sentence
end

str = 'Please call me at five Five FIVE one two three four. Thanks.'
p word_to_digit(str) == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
p str