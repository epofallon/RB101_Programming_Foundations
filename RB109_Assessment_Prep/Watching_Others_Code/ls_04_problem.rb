=begin
# The maximum sum subarray problem consists in finding the maximum sum of a contiguous subsequence in an array of integers:
#   maxSequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
#   -- should be 6: [4, -1, 2, 1]
# Easy case is when the array is made up of only positive numbers and the maximum sum is the sum of the whole array.
# If the array is made up of only negative numbers, return 0 instead.
# 
# Empty array is considered to have zero greatest sum. Note that the empty array is also a valid subarray.

# Problem
  # find the sub array in an array that containxs the largest sum.
  # The sub array can be any length
  # If all numbers are positive, returns the simple sum
  # If all numbers are negative return 0
  
  # input - array
  # output - integer
  
# examples
  p max_sequence([]) == 0
  p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
  p max_sequence([11]) == 11
  p max_sequence([-32]) == 0
  p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12  
  
# data - arrays

# algorithm
  # result array = []
  # iterate from 0 to length of the array
    # iterate from 0 to length of array
    # add an array that ranges from first idx to second idx to the result array
    
  # iterate through the result array and collect the sum of all the subarrays
  # find the maximum sum of the sub arrays
=end

def max_sequence(array)
  return 0 if array.all? {|num| num < 0}
  result = []
  
  (0...array.size).each do |index1|
    (index1...array.size).each do |index2|
      p result << array[index1..index2]
    end
  end
  result.max_by { |sub_array| sub_array.sum }
end

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12 