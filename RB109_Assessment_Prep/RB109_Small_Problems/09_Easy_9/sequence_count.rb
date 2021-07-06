=begin
- input: two integers
  - the first integer is a count
  - the second integer is the first number in a sequence
- output: an array
  - has the number of elements as the first integer
  - the values of each element will be multiples of the starting number
- explicit requirements: 
  - first integer will always 0 or greater
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []
======================

- data structure:
  - an array
  
- algortihm:
  1. create a range from 1 to the count input
  2. iterate through the range using map
    3. multiply the current number by the second integer input
  
=end

def sequence(count, start_num)
  (1..count).map { |num| num * start_num }
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []