=begin
- input: a string containing one or more words
- output: returns that string with words that contain five or more charachters reversed. 
- explicit requirements:
  - each string will only consist of letters and spaces
  - mutate the string in place
  - reverse the letters in words that are >= 5 letters
- implicit requirements:
  - no case change to any letters
  
'Professional' --> 'lanoisseforP'

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

- Data structures:
  - since we mutate the argument string we will maintain that string
  - an array to handle words individually
  
- Algorithm:
  1. Split string into an array of words
  2. Iterate through the array of words
  3. if a word has a length >= 5
    A. substitute the word in the string for it's reverse
  4. Else
    A. Do nothing

=end

def reverse_words(string)
  string.split.each do |word|
    string.gsub!(word, word.reverse) if word.size >= 5
  end
  string
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS