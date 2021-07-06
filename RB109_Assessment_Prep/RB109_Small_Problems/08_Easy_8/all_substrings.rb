=begin
- input: a string
  - 
- output: an array
  - contains all substrings of a string
- explicit requirements: 
  - ordered by where in the string the substring begins
    - all substrings that start at position 0 should come first, then at position 1 ... etc.
    - all substrings at a given position should be ordered from smallest to largest
- questions: 
  - 
- implicit requirements:
  - 01 02 03 04 05
    11 12 13 14
    21 22 23
    31 32
    41
  - we iterate through the starting index in the outer loop (every index position)
  - we iterate through the length in the inner loop (from 1 upto the length minuse the starting position)

===== Test Cases =====
substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
======================

- data structure:
  - array
  
- algortihm:
  1. initialize `subs_arr` to an empty array
  2. iterate through each index of the input string
    3. iterate through string length starting at 1 and ending at the string length minus the starting index
      4. push the substring at the starting index of the length to subs_arr
  5. return `subs_arr`
  
=end

def substrings(str)
  subs_arr = []
  str_size = str.size
  
  str_size.times do |start_idx|
    1.upto(str_size - start_idx) do |sub_size|
      subs_arr << str[start_idx, sub_size]
    end
  end
  
  subs_arr
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]