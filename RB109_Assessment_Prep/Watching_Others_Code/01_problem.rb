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

#===> A Good Quesiton: Which substrings do I need to test? All or some?

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

=begin
  # argument - string
  # return true or false
    # rules - the entire string is a repeating substring
    # clarifying question 'aaaaaa' has a pattern from substring 'a'
    
  # option 1
    # create an array of substrings that are in length the factors of the string (up to half the length of the string)
    # for each substring multiply it by the length of the string divided by the length of the substring
    # check if that substring multiplication is equal to the string
=end
def get_substrings(string)
  # substrings = []
  # 0.upto(string.size - 1) do |starting_index|             # do not need outer loop because substring need will always start with 0
  #   1.upto(string.size - starting_index) do |sub_length|  # only go upto the halfway point of the string to get all possible substrings that could be a pattern
  #     substrings << string[starting_index, sub_length]
  #   end
  # end
  # substrings.delete_if{|sub_str| sub_str == string}.uniq  # don't need to remove duplicates or the original string with the above chagnes
  
  substrings = []                            # 
  1.upto(string.size / 2) do |sub_length|    # 1 upto half the length of the string
    if (string.size % sub_length == 0)       # only do substrings that have a length that the original string length is divisible by
      substrings << string[0, sub_length]    # string only starts with 0 because we are looking for a pattern
    end                                      # 
  end
  substring
end

def repeated_substring_pattern(str)
  # substrings = get_substrings(str)
  # substrings.each do |sub_str|
  #   sub_pattern = sub_str
  #   loop do
  #     break if sub_pattern.size >= str.size
  #     sub_pattern += sub_str
  #   end
  #   return true if sub_pattern == str
  # end
  # false
  
  substrings = get_substrings(string)                 #
  substrings.each do |substring|                      #
    multiplier = string.size / substring.size         # get the number of times the substring is divisible into the string
    return true if substring * multiplier == string   # return true if the substring times the multiplier is equal to the input string
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
