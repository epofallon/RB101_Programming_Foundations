=begin
- input: an array
  - 
- output: two arrays nested in another array
  - 
- explicit requirements: 
  - on odd number arrays the middle element should be placed in the first half array
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====

======================

- data structure:
  - 
  
- algortihm:
  1. 
  
=end

def halvsies(arr)
  middle = arr.size.odd? ? (arr.size / 2) : (arr.size / 2 - 1)
  arr.partition.with_index { |elem, idx| idx <= middle }
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]