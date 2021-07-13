=begin
# The maximum sum subarray problem consists in finding the maximum sum of a contiguous subsequence in an array of integers:
#   maxSequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
#   -- should be 6: [4, -1, 2, 1]
# Easy case is when the array is made up of only positive numbers and the maximum sum is the sum of the whole array.
# If the array is made up of only negative numbers, return 0 instead.
# 
# Empty array is considered to have zero greatest sum. Note that the empty array is also a valid subarray.

- input: an array of integers
  - can have positive and negative integers
  - can be empty
  - can have only negative integers
- output: an integer
  - integer is the largest sum of any contiguous subarray from the input array
    - 0 if all elements are negative
    - 0 if the input array is empty
- explicit requirements: 
  - input array can be:
    - only one element
    - empty --> 0
    - all negative --> 0
  - valid subarrays include:
    - the whole inputted array
    - any contiguous subarray
    - an empty array (with an empty array included this will auto default all negative arrays to 0)
    - a single number

===== Test Cases =====
p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
======================

- data structure:
  - an array to store the current subarray with the largest sum
  - an integer to store the actual sum

  1. starting index will go from [0]-->[length - 1]
  2. starting length will go from [0]-->[length - starting index]

- algortihm:
  0. initialzie biggest_sum to 0
  0. initialzie summed_sub to []
  1. iterate through each starting index in the array
    2. iterate from lengths 0 to array length - starting index
      3. slice the array with the starting index and length
      4. sum the sub array
      5. if the sum is larger biggest_sum
        6. reassign summed_sub to the sub_array
        7. reassign biggest_sum to current_sum
  8. return biggest_sum
  
=end

def max_sequence(arr)
  biggest_sum = 0
  
  arr.each_index do |start_idx|
    0.upto(arr.length - start_idx) do |sub_size|
      current_sum = arr[start_idx, sub_size].sum
      biggest_sum = current_sum if current_sum > biggest_sum
    end
  end
  
  biggest_sum
end

p max_sequence([-1, -2, -3, -4]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12