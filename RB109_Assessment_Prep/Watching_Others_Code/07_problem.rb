=begin
Write a function scramble(str1, str2) that returns `true` if a portion of `str1` characters
can be arranged to match `str2`, otherwise return `false`.

str1 = 'rkqodlw' & str2 = 'world'
output => true

str1 = 'cedewaraaossoqqyt' & str2 = 'codewars'
output => true

str1 = 'katas' & str2 = 'steak'
output => false

- input: two strings
  - 
- output: boolean true or false
  - true if some or all of the characters in str1 can be used to create str2
- explicit requirements: 
  - only lowercase letters
  - 
- questions: 
  - 
- implicit requirements:
  - each letter from str1 can only be used once

- test cases
p scramble('javass', 'jjss') == false #=> missing the second 'j'
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false #=> missing the 'e'
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true

- data structure:
  - an array of charachters for both strings
  
- algortihm:
  - split str2 into an array of characters
  - split str1 into an array of characters
  - str1_size = str1 chars length
  - iterate through str2's characters
    - iterate through str1's characters with index
      - if str1's charachter is equal to the current str2 character
        - remove the character at the current index from str1's array of characters
        - break
    - end
    - if str1's characters array changed length
      - reassign str1_size to new length
    - else
      - return false
  - end
  - implicitly return true
=end

def scramble(str1, str2)
  # str1_chars = str1.chars
  # str2_chars = str2.chars
  # str1_chars_size = str1_chars.size
  
  # str2_chars.each do |char2|
  #   str1_chars.each_with_index do |char1, idx1|
  #     if char1 == char2
  #       str1_chars.delete_at(idx1)
  #       break
  #     end
  #   end
  #   if str1_chars.size != str1_chars_size
  #     str1_chars_size = str1_chars.size
  #   else
  #     return false
  #   end
  # end
  # true
  
  str2.chars.each do |char|
    return false if str1.count(char) < str2.count(char)
  end
  true
end

p scramble('javass', 'jjss') == false #=> missing the second 'j'
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false #=> missing the 'e'
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true