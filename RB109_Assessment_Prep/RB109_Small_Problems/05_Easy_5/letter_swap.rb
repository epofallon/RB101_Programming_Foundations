=begin
- input: a string 
  - words seperated by spaces
- output: a new string
  - the first and last letter of every word swapped
- explicit requirements: 
  - every word contains at least one charachter
  - string will always contain at least one word
  - each string contains nothing but words and spaces
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'
======================

- data structure:
  - 
  
- algortihm:
  1. split the string into an array of words
  2. interate through the array of words
    3. swap the charachters
  4. rejoin with spaces
=end

# def swap(sentence)
#   sentence.split.each { |word| word[0], word[-1] = word[-1], word[0] }.join(' ')
# end

def swap_first_last_characters(a, b)
  a, b = b, a
  # word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word[0], word[-1])
  end
  p result
  result.join(' ')
end

str = 'Oh what a wonderful day it is'
p swap(str) #== 'hO thaw a londerfuw yad ti si'

# p swap('Abcde') == 'ebcdA'
# p swap('a') == 'a'