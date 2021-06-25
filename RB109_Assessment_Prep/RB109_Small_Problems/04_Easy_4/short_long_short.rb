=begin
- input: two strings
  -
- output: a string
  - concatenation of the shorter string, then longer string, then shorter string again
- explicit requirements:
  - you can assume that all the strings are different lengths
- implicit requirements:
  -

===== Test Cases =====
short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"
======================

- data structure:
  - strings
  
- algortihm:
  #- initialize result to a blank string
  1. if str1 is longer than str2
    - concat str1 then str2 onto str2
    - assign to result
  2. if str1 is shorter than str2
    - concat str2 then str1 onto str1
    - assign to result
  3. return result
  
  
=end

def short_long_short(str1, str2)
  if str1.size > str2.size
    str2.concat(str1, str2)
  elsif str1.size < str2.size
    str1.concat(str2, str1)
  else
    "strings are the same length"
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"