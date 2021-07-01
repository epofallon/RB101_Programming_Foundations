=begin
Given an array of strings made only from lowercase letters, return an array of all
charachters that show up in all strings within the given array (including duplicates).
For example, if a charachter occurs 3 times in all strings but not 4 times, you need to
include that character three times in the final answer.

p common_chars(["bella", "label", "roller"]) == ["e", "l", "l"]
p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]
p common_chars(["aabbaaaa", "ccdddddd", "eeffee", "ggrrrrr", "yyyzzz"]) == []
=end
=begin
- input: an array of strings
  - strings are made of lowercase letters
- output: an array of strings
  - strings are a single letter
  - strings are the lowercase letters that are present in all strings from the input array
- explicit requirements:
  - include duplicates (if a charachter occurs 3 times in all strings, if needs to be included in the output array 3 times)
  - all letters are lowercase
- questions:
  - do strings come 
- implicit requirements:
  - keep track of what letters and how many of each are in each string 

===== Test Cases =====

======================

- data structure:
  - a hash with keys being string letters and values being a count would work well
  - a hash to hold those hashes with key being the string and value being the hash
  
- algortihm:
  1. for the first word
    2. record what letters and how many are in a word
  3. initialize `result` array
  4. if the value for a letter is in every word and the value is the same for every word
    5. add that letter to the result the number of times it is found
  
=end
def count_letters(str)
  letters = Hash.new(0)
  str.each_char{ |char| letters[char] += 1 }
  letters
end

def common_chars(arr)
  letters = count_letters(arr.map{|word| word}.shift)

  result = []
  letters.each do |letter, count|
    if arr.all?{ |word| word.count(letter) > 0 }
      min_num = ([count] + arr.map{|word| word.count(letter)}).min
      min_num.times { result << letter }
    end
  end
  result
end

arr = ["bella", "label", "roller"]
p common_chars(arr) == ["e", "l", "l"]
# p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
# p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]
# p common_chars(["aabbaaaa", "ccdddddd", "eeffee", "ggrrrrr", "yyyzzz"]) == []
p arr