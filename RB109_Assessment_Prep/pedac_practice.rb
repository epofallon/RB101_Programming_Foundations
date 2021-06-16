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
    
    
    'h e l l o'
     0 1 2 3 4
     
     0-0, 0-1, 0-2, 0-3, 0-4
     1-1, 1-2, 1-3, 1-4
     2-2, 2-3, 2-4
     3-3, 3-4
     4-4
     start goes 0, 1, 2, 3, 4,
     end goes   0, 1, 2, 3, 4,
                   1, 2, 3, 4,
                      2, 3, 4,
                         3, 4,
                            4
=end