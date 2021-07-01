=begin
Given an array of strings made only from lowercase letters, return an array of all
charachters that show up in all strings within the given array (including duplicates).
For example, if a charachter occurs 3 times in all strings but not 4 times, you need to
include that character three times in the final answer.

p common_chars(["bella", "label", "roller"]) == ["e", "l", "l"]
p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]
p common_chars(["aabbaaaa", "ccdddddd", "eeffee", "ggrrrrr", "yyyzzz"]) == []

input - an array of lowercase strings
return - an array of every charachter that appears in all of the strings
  - if a charachter appears twice in each string, the return array should contain two elements of that charachter
  
- set chars equal to the charachters of the first element (remove the first element from the array)
- iterate through the charachters (with select)
  - iterate through the words in the array
    - check if all the words contain the charachter
      - block should return true
      - remove one of that character from the string
=end

def common_chars(array)
  array = array.map { |word| word.dup }
  
  chars = array.shift.chars
  p chars
  
  chars.select do |char|
    array.all? { |word| word.sub!(char, "") }
  end
end

p common_chars(["bella", "label", "roller"]) #== ["e", "l", "l"]
p common_chars(["cool", "lock", "cook"]) #== ["c", "o"]
# p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]
# p common_chars(["aabbaaaa", "ccdddddd", "eeffee", "ggrrrrr", "yyyzzz"]) == []