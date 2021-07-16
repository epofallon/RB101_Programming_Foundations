=begin
Write a function scramble(str1, str2) that returns `true` if a portion of `str1` characters
can be arranged to match `str2`, otherwise return `false`.

str1 = 'rkqodlw' & str2 = 'world'
output => true

str1 = 'cedewaraaossoqqyt' & str2 = 'codewars'
output => true

str1 = 'katas' & str2 = 'steak'
output => false

# split string into characters (both strings)
# iterate through string 2
# on each iteraton of string 2, iterate through string 1
# if string 2 charachter matches character in string 1.
  # find the count of the characters in string 1.
# if the count of characters in string 1 is not equal to or greater than the count of the chracter in string 2, it is  false
# else return true

=end

def scramble(str1, str2)
  str1_chars = str1.chars
  str2_chars = str2.chars
  str2_chars.each do |char2|
    return false if str1.count(char2) < str2.count(char2)
  end
  true
end

p scramble('javass', 'jjss') == false #=> missing the second 'j'
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false #=> missing the 'e'
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true