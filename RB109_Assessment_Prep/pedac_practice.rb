# PROBLEM:
=begin
  Given a string, write a method `palindrome_substrings` which returns
  all the substrings from a given string which are palindromes. Consider
  palindrome words case sensitive.
  
  - Input: A string object
  - Output: An array of strings
    - strings will be the sub-strings of the input that are palindromes
  - Explicit Rules:
    - Palindromes are case sensitive
    - Only retunrs substrings that are palindromes
  - Implicit Rules:
    - Returns an empty array when there are no palindrome substrings
    - Returns an empty array when the input string object is an empty string

=end

# Test cases:
=begin
  palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
  palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
  palindrome_substrings("palindrome") == []
  palindrome_substrings("") == []
=end

# Data Structure -> an Array of Strings

# Algorithm
=begin
  - get an array of all substrings
    - Extract into a method substrings
  - assign the array of all substrings to a variable all_subs
  - iterate over array of all substrings
    - return array of substrings where the substring is equal to its reverse
  
  # algorithm to get all substrings from a string
    - initialize a variable to an empty array
    - initialize a variable to 0 for the starting index
    - initialize a variable to length of string
    - begin outer loop
      - initialize a variable to 1 for the slice length
      - begin inner loop
        - push substring of string[starting index, slice length]
        - increment slice length by 1
        - break when ending index is equal to length variable
      - increment starting index
      - decrement the slice length
      - break when starting index is equal to string length
    - return array of sub strings
    
    'h e l l o'
     0 1 2 3 4
     0-1, 0-2, 0-3, 0-4
     1-2, 1-3, 1-4
     2-3, 2-4
     3-4
     
     start goes 0, 1, 2, 3,
     end goes   2, 3, 4, 5,
                   2, 3, 4,
                      2, 3,
                         2
=end
def substrings(string)
  result = []
  starting_index = 0
  loop do
    num_chars = 2
    loop do
      result << string[starting_index, num_chars]
      break if num_chars == string.size - starting_index
      num_chars += 1
    end
    break if starting_index == string.size - 2
    starting_index += 1
  end
  result
end

def is_palindrome?(str)
  str == str.reverse
end

def palindrome_substrings(string)
  substrings(string).select { |sub_str| is_palindrome?(sub_str) }
end
=begin
p palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
p palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome") == []
p palindrome_substrings("") == []
=end



p palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]