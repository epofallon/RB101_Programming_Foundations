=begin
# Given 2 strings, your job is to find out if there is a substring
  that appears in both strings. You will return true if you find a
  substring that appears in both string, or false if you do not.
# We only care about substrings that are longer than one letter long.

# Rules
#  Substrings must be two charachters long
#  In the same order
#  case doesn't matter

# split strings into characters
# iterate through str1_chars with index and iterate through str2_chars
#   if character matches charachter in str2 on iteration,
#     add one to index and check if str1_chars[idx1 + 1] matches str2_chars[idx2 + 1]. If so return true
#   else false

=end
def substring_test(str1, str2)
  str1_chars = str1.downcase.chars
  str2_chars = str2.downcase.chars
  str1_chars.each_with_index do |char1, idx1|
    str2_chars.each_with_index do |char2, idx2|
      if char1 == char2 && str1_chars[idx1 + 1] == str2_chars[idx2 + 1]
    end
  end
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