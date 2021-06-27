=begin
- input: array of number
  -
- output: an array
  - with the same number of elements
  - each element has the running total from the original array
- explicit requirements:
  - 
- implicit requirements:
  - empty array returns empty array
  - a single element array will return a single element array with the same integer

===== Test Cases =====
running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []
======================

- data structure:
  - arrays
  
- algortihm:
  1. 
  
    
  
  
  0 + 14 --> 14
  14 + 11 --> 25
  25 + 7 --> 32
  
=end

def running_total(arr)
  sum = 0
  arr.each_with_object([]) { |num, run_arr| run_arr << sum += num }
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []