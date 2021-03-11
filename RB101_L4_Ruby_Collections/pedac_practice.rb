# PROBLEM

  # Given a string, write a method 'palindrome_substrings' which returns
  # all the substrings from a given string which are palindromes. Consider
  # palindrome words case sensitive.

# Test Cases:

  # palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
  # palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
  # palindrome_substrings("palindrome") == []
  # palindrome_substrings("") == []

# Understand the Problem

  # input: string
  # output: an array of substrings
  
  # Explicit Requirements:
    # Every palindrome substring is added to the output array
    # Palindromes are case sensitive
  
  # Implicit Requitements:
    # The returned object is always an array, even when empty (seen in test cases)
    # Palindromic substrings must all be returned, even if it is a smaller palindrome within a larger palindrome
      # The original object isn't modified to check the string like this

# Data Structure

  # Since the desired output is always and array, that will be our data structure
  
# Algorithm

  # - initialize a result variable to an empty array.
  # - create an array named substring_arr that contains all of the
  #   substrings of the input string that are at least 2 characters long.
  # - loop through the words in the substring_arr array.
  # - if the word is a palindrome, append it to the result array
  # - return the resultl array
  
def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substring_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end

# for each starting index from 0 through the next to last index position
  # for each substring length from 2 until there are no substrings of that length
    # extract the substring of the indicated length starting at the indicate index position
  # end inner loop
# end outer loop

# - create an empty array called 'result' that will contain all required substrings
# - creat a 'starting_index' variable (value '0') for the starting index of a substring
# - start a loop that iterates over 'starting_index' from '0' to the length of the string minus 2
#   - create a 'num_chars' variable (value '2') for the length of a substring
#   - start an inner loop that iterates over 'num_chars' from '2' to 'string.length - starting_index'