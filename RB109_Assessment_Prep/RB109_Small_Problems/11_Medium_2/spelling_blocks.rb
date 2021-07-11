=begin
- input: a string
  - a word
- output: a boolean
  - true when the input word only uses a spelling block once
- explicit requirements: 
  - spelling blocks:
      B:O   X:K   D:Q   C:P   N:A
      G:T   R:E   F:S   J:W   H:U
      V:I   L:Y   Z:M
  - cannot use both the letters in a spelling block
  - can only use a spelling block once
  
- questions: 
  - 
- implicit requirements:
  - word can be upper or lowercase

===== Test Cases =====
block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true
======================

- data structure:
  - an array of strings
  
- algortihm:
  1. initialize the spelling block array
  2. iterate through the array using all
    3. return true when a spelling block is found one or less times in the string
    4. return false when a spelling block is found more than once in the string
  
=end

LETTER_BLOCKS = %w(bo xk dq cp na gt re fs jw hu vi ly zm)

def block_word?(word)
  LETTER_BLOCKS.all? { |block| word.downcase.count(block) < 2 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true