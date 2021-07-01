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
  substrings = []
  1.upto(string.size / 2) do |num|
    if (string.size % num == 0)
      substrings << string[0, num]
    end
  end
  substring
end

def repeated_substring_pattern(string)
  substrings = get_substrings(string)

  substrings.each do |substring|
    multiplier = string.size / substring.size
    return true if substring * multiplier == string
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
# make sure variable names are descriptive
# extract logic into seperate methods