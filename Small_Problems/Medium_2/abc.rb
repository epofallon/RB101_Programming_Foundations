# Understand the Problem
=begin
  - A collection of spellin blocks has two letters per block:
    B:O   X:K   D:Q   C:P   N:A
    G:T   R:E   F:S   J:W   H:U
    V:I   L:Y   Z:M
  
  - This limits the words you can spell with the blocks to words that
    do not use both letters from any given block.
  - Each block can only be used once.
  
  - input: a one word string
  - output:
    - return 'true' if a word passed in can be spelled from the set of blocks
    - return 'false' otherwise
  - explicit rules:
    - words can only be spelled with one side of a block
      - i.e. can't use both the letters in a block
    - each block can only be used once
=end

# Examples / Test Cases
=begin
  block_word?('BATCH') == true
  block_word?('BUTCH') == false
  block_word?('jest') == true
=end