=begin
- input: two arrays
  - 
- output: a single array
  - contains all the values of the argument arrays
- explicit requirements: 
  - no duplication of values in the returned array
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
======================

- data structure:
  - 
  
- algortihm:
  1. 
  
=end

def merge(arr1, arr2)
  (arr1 + arr2).uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]