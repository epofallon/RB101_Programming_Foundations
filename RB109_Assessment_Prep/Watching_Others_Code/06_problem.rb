=begin
# Given 2 strings, your job is to find out if there is a substring
  that appears in both strings. You will return true if you find a
  substring that appears in both string, or false if you do not.
# We only care about substrings that are longer than one letter long.
- input: two strings
  - 
- output: boolean
  - true if there is a substring that appears in both strings
  - false otherwise
- explicit requirements: 
  - substrings longer than one letter
- questions: 
  - 
- implicit requirements:
  - substrings will be case insensitive
  - two empty strings return false

- test cases
  -

- data structure:
  - substrings
  
- algortihm:
  - check_subs to the first input string unless the second input string is smaller
  - from 0 to check_subs length - 2
    - from 2 to check_subs length minus the starting idx
      - return true if the other string contains the sub string
  - implicitly return false
  
=end
def substring_test(str1, str2)
  short, long = [str1.downcase, str2.downcase].sort
  (0..short.size - 2).each do |idx|
    (2..short.size - idx).each do |sub_size|
      return true if long.include?(short[idx, sub_size])
    end
  end
  false
end


p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', 'Fun') == false
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('123456', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true