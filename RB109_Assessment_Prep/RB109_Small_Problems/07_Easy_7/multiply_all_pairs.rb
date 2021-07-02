=begin
- input: two arrays of integers
  - 
- output: a new array
  - contains the product of every pair of numbers that can be formed between the elements of the two Arrays sorted in increasing value
- explicit requirements: 
  - 
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====

======================

- data structure:
  - an array
  
- algortihm:
  1. 
  
=end

def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |arr| arr.reduce(:*) }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]