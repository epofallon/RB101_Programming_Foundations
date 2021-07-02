=begin
- input: two arrays that can have any objects
  - 
- output: 
  - 
- explicit requirements: 
  - take the elements in alteration
  - both arguments won't be empty and will have the same number of elements
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====

======================

- data structure:
  - array
  
- algortihm:
  1. initialize interwoven as []
  2. arr1.size times 
    3. add the element from arr1 at current num to interwoven
    4. add the element from arr2 at current num to interwoven
  5. return interwoven
=end

def interleave(arr1, arr2)
  # interwoven = []
  # arr1.size.times { |idx| interwoven << arr1[idx] << arr2[idx] }
  # interwoven
  arr1.union(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) #== [1, 'a', 2, 'b', 3, 'c']