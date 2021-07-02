=begin
- input: two arrays
  - each is a list of numbers
- output: a new array
  - the product of each pair of numbers from the argument arrays that have the same index
- explicit requirements: 
  - arguments will contain the same number of elements
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
======================

- data structure:
  - 
  
- algortihm:
  1. iterate through the first argument array with it's index using map
    2. multiply the element by the element at the same index from the other array
  
=end

def multiply_list(arr1, arr2)
  # arr1.map.with_index { |num, idx| num * arr2[idx] }
  arr1.zip(arr2).map {|arr| arr.reduce(:*) }
end
p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]