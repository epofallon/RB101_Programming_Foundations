=begin
- input: a string
  - 
- output: an array of substrings that start at the beginning of the original string
  - 
- explicit requirements: 
  - arranged in order from shortest to longest
- questions: 
  - 
- implicit requirements:
  - does include a substring the length of the original string

===== Test Cases =====
leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
======================

- data structure:
  - an array
  
- algortihm:
  1. initialize subs_arr as an empty array
  2. always starting at 0, iterate from sub array length 1 up to the length of the original array
    3. slice the array starting at index 0 with the current length
    4. add that string slice to subs_arr
  5. return subs_arr
=end

def leading_substrings(str)
  subs_arr = []
  1.upto(str.size) do |sub_size|
    subs_arr << str[0, sub_size]
  end
  subs_arr
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']