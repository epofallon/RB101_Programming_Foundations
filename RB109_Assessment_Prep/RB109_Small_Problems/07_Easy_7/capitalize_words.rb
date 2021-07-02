=begin
- input: a string
  - 
- output: a new string
  - 
- explicit requirements: 
  - 
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====

======================

- data structure:
  - 
  
- algortihm:
  1. 
  
=end

def word_cap(string)
  # string.split.map(&:capitalize).join(' ')
  lowercase = ('a'..'z').to_a
  cases = Hash.new { |hash, key| hash[key] = key}
  lowercase.each { |letter| cases[letter] = letter.upcase }
  
  string.split.each do |word|
    word.downcase!
    word[0] = cases[word[0]]
  end.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'