=begin
  Given a non-empty string, check if it can be constructed by taking a substring of it
  and appending multiple copies of the substring together. You may assume the given
  string consists of lowercase, English letters only.
  
  # Example 1:
    # Input: 'abab'
    # Output: True
    # Explanation" It's the substring 'ab' twice.
  
  # Example 2:
    # Input: 'aba'
    # Output: False

- input: a string of lowercase english letters
  -
- output: a boolean
  - true when the string can be created by taking a substring an appending multiple copies of itself together
  - false otherwise
  
  "abab" --> 'ab' x2
  "aba" --> cannot be recreated by substring
  "aabaaba" --> cannot be recreated by substring
  "abaababaab" --> 'abaab' x2
  "abcabcabcabc" --> 'abc' x4 OR 'abcabc' x2
  
- explicit requirements:
  - 
- implicit requirements:
  - string can repeat more than just twice
  - it can be any substring of the provided string
    - implies that if it finds one, it doesn't need to keep checking the rest of the substrings

===== Test Cases =====
p repeated_substring_pattern("abab") == true
p repeated_substring_pattern("aba") == false
p repeated_substring_pattern("aabaaba") == false
p repeated_substring_pattern("abaababaab") == true
p repeated_substring_pattern("abcabcabcabc") == true
======================

- data structure:
  - an array of all the substrings

    'halo' 
     h  ha  hal halo
     01 02  03  04
         a   al  alo
         11  12  13
              l   lo
              21  22
                   o
                   31  
- algortihm:
  1. get substrings
    initialize substrings = []
    from 0 upto length - 1
      initialize sub_length to 1
      from sub_length to (length - starting_index)
        push the substring starting at starting_index with length sub_length to the substrings array
        

  2. iterate through all substrings
    - for each substring
      - repeat it out until it is the length or greater of the input string
      - begin a loop
    - return `true` if a substring pattern is equal to the input string 
  
=end
def get_substrings(string)
  substrings = []
  0.upto(string.size - 1) do |starting_index|
    1.upto(string.size - starting_index) do |sub_length|
      substrings << string[starting_index, sub_length]
    end
  end
  substrings.delete_if{|sub_str| sub_str == string}.uniq
end

def repeated_substring_pattern(str)
  substrings = get_substrings(str)
  
  substrings.each do |sub_str|
    sub_pattern = sub_str
    loop do
      break if sub_pattern.size >= str.size
      sub_pattern += sub_str
    end
    return true if sub_pattern == str
  end
  false
end

start = Time.now
p repeated_substring_pattern("abab") == true
p repeated_substring_pattern("aba") == false
p repeated_substring_pattern("aabaaba") == false
p repeated_substring_pattern("abaababaab") == true
p repeated_substring_pattern("abcabcabcabcabcabcabcabcabcabcabcabc") == true
finish = Time.now
p finish - start
