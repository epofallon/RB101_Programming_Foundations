=begin
  You are going to be given an array of integers. Your job is to take that array and find
  an index N where the sum of the integers to the left of N is equal to the sum of the
  integers to the right of N. If there is no index that would make this happen, return -1.
  
  [1, 2, 3, 4, 3, 2, 1] --> index 3 (value 4) both sides of this index have an equal value.
  
  [20, 10, -80, 10, 10, 15, 35] --> index 0 (value 20). [] & [10, -80, 10, 10, 15, 35] have the same value 0

- input: an array of integers
  - 
- output: an integer
  - the index where the sum of each side of that index is equal
- explicit requirements: 
  - empty arrays sum to 0 (and count as a side)
  - if no index is found return -1
- questions: 
  - 
- implicit requirements:
  - sum negative numbers as well
  - every index can be a split

- test cases
  -

- data structure:
  - arrays
  
- algortihm:
  - initialize `right` to an empty array
  - initialize `left` to the input array
  
  - array length number of times
    - assign `current_num` to shifting out the first element of left
    - return current index if the sum of left and right are equal
    - add current_num to right
  - implicitly return -1
  
=end
def find_even_index(arr)
  right = []
  left = arr
  
  arr.size.times do |idx|
    current_num, left = [left.first, left[1..-1]]
    return idx if right.sum == left.sum
    right << current_num
  end
  
  -1
end

arr = [1, 2, 3, 4, 3, 2, 1]
p find_even_index(arr) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3