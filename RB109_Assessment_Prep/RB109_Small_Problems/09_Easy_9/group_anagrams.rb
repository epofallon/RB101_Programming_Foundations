=begin
- input: an array of strings
  - 
- output: print to the screen
  - the elements grouped into anagrams
- explicit requirements: 
  - 
- questions: 
  - what is an anagram?
    - words that have the same letters but in a different order
- implicit requirements:
  - anagrams are grouped into arrays
  - prints in order of the anagram groups found

===== Test Cases =====
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
          
          'demo' 'dome' 'mode'
          'none' 'neon'
          'tied' 'diet' 'edit' 'tide'
          'evil' 'live' 'veil' 'vile'
          'fowl' 'wolf' 'flow'
======================

- data structure:
  - a hash where the keys are sorted letters from input
    - the default value will be an empty array
    
  
- algortihm:
  1. initialize anagrams hash with a default value of an empty array
  2. iterate through the input array 
    3. add the word's sorted charachters as a key and push the word into the value array
  4. iterate through the values of the hash and print each
  
=end

def anagram_groups(words)
  # anagrams = Hash.new([])
  # words.each do |word|
  #   sorted_word = word.chars.sort.join
  #   anagrams[sorted_word] += [word]
  # end
  anagrams = words.group_by { |word| word.chars.sort.join }
  anagrams.each_value { |anagrams_set| p anagrams_set }
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

anagram_groups(words)