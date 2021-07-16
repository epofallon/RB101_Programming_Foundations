=begin
Find the length of the longest substring in the given string that is the same in reverse.
"I like racecars that go fast" --> 'racecar' --> 7
Return 0 if the length of the input string is 0

p longest_palindrome("a") == 1 # 'a'
p longest_palindrome("aa") == 2 # 'aa'
p longest_palindrome("baa") == 2 # 'aa'
p longest_palindrome("aab") == 2 # 'aa'
p longest_palindrome("baabcd") == 4 # 'baab'
p longest_palindrome("baablkj12345432133d")) == 9 # '123454321'


- input: a string
  - 
- output: an integer
  - the length of the longest palindromic substring
- explicit requirements: 
  - return 0 if given an empty string
- questions: 
  - 
- implicit requirements:
  - do not need to deal with uppercase letters

- test cases
  -

- data structure:
  - 
  
- algortihm:
  - initialize long_palin_size to 0
  - find substrings of length 1 upto input string length
  - if substring is palindromic
    - check if substring length is longer than current longest palindromic substring
      - if so, reassign long_palin_size to the length of that palidromic substring
  - return 
  
=end

def longest_palindrome(str)
  long_palin_size = 0
  (0..str.size - 1).each do |start_idx|
    (1..str.size - start_idx).each do |sub_size|
      current_sub = str[start_idx, sub_size]
      if current_sub == current_sub.reverse &&  current_sub.size > long_palin_size
          long_palin_size = current_sub.size
      end
    end
  end
  long_palin_size
end

p longest_palindrome("a") == 1 # 'a'
p longest_palindrome("aa") == 2 # 'aa'
p longest_palindrome("baa") == 2 # 'aa'
p longest_palindrome("aab") == 2 # 'aa'
p longest_palindrome("baabcd") == 4 # 'baab'
p longest_palindrome("baablkj12345432133d") == 9 # '123454321'