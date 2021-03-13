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
  # - substring method
  # ==================
  #   - create an empty array called 'result' that will contain all required substrings
  #   - creat a 'starting_index' variable (value '0') for the starting index of a substring
  #   - start a loop that iterates over 'starting_index' from '0' to the length of the string minus 2
  #    - create a 'num_chars' variable (value '2') for the length of a substring
  #    - start an inner loop that iterates over 'num_chars' from '2' to 'string.length - starting_index'
  #       - extract a substring of length 'num_chars' from 'string' starting at 'starting_index'
  #       - append the extracted substring to the 'result' array
  #      - increment the 'num_chars' variable by 1
  #    - end the inner loop
  #    - increment the 'starting_index' variable by '1'
  #   - end the outer loop
  #   - return the 'result' array
  
  # - is_palindrome? method
  # =======================
  #   - given substring
  #   - evaluate if substring is equal to its reverse (case sensitive)
  #   - return bool from evaluation
  
  # - palidrome_substrings method
  # =============================
  #   - initialize a result variable to an empty array.
  #   - create an array named substring_arr that contains all of the
  #     substrings of the input string that are at least 2 characters long.
  #   - loop through the words in the substring_arr array.
  #   - if the word is a palindrome, append it to the result array
  #   - return the result array
  
# Substrings Algorithm converted to Formal Pseudo Code

  # START
  
  # /* Given a string named 'string' */
  
  # SET result = []
  # SET starting_index = 0 
  
  # WHILE starting_index <= string.length - 2
  #   SET numChars = 2
  #   WHILE numChars <= string.length - starting_index
  #   SET substring = numChars characters from string starting at index starting_index
  #   append substring to result array
  #   SET numChars = numChars + 1
  # SET starting_index = starting_index + 1
  
  # RETURN result array
  
  # END
  
def substrings(string)
  result = []
  starting_index = 0
  
  while (starting_index <= string.length - 2) do
    num_chars = 2
    while num_chars <= string.length - starting_index do
      substring = string[starting_index, num_chars]
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  result
end
  
def is_palindrome?(substring)
  substring == substring.reverse
end

def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end

p palindrome_substrings("supercalifragilisticexpialidocious") #== ["ili"]
p palindrome_substrings("abcddcbA")# == ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome") #== []
p palindrome_substrings("") #== []