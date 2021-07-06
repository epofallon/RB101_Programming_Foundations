=begin
- input: a string
  - 
- output: an array of all the substrings that are palindromic
  - 
- explicit requirements: 
  - should be arranged in the order of how the substrings appear in the input string
  - include duplicate palindromes
  - pay attention to case, and non-alphanumeric charachters when considering palindromes
  - single letter strings are not palindromes
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
======================

- data structure:
  - an array of substrings
  
- algortihm:
  1. get array of all substrings length > 2
  2. select substrings that are palindromes
  
=end

def substrings(str)
  subs_arr = []
  str_size = str.size
  
  str_size.times do |start_idx|
    2.upto(str_size - start_idx) do |sub_size|
      subs_arr << str[start_idx, sub_size]
    end
  end
  
  subs_arr
end

def palindromes(str)
  subs_arr = substrings(str.downcase.delete "^a-z")
  subs_arr.select { |sub_str| sub_str == sub_str.reverse }
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]