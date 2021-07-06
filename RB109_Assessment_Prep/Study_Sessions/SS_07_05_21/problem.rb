=begin
# Given an array of n positive integers and a positive integer s,
  find the minimal length of a contiguous subarray of which the sum ≥ s.
  If there isn't one, return 0 instead.

- input: an array and an integer
  - array of positive integers
  - a positive integer representing a sum
- output: an integer
  - the minimal lenth of a contiguous subarray of which the sum >= the input integer
- explicit requirements: 
  - sub array must be contiguous, cannot pick an choose elements
- questions: 
  - 
- implicit requirements:
  - can start at any element

- data structure:
  - sub arrays
  
- algortihm:

  2. start with sub arrays that start at index 0
    3. sub arrays of length 1 through the final element
    4. sub arrays of length 2 through the second to final element
    5. sub arrays of length 3 through the third to final element
    arr = [0, 1, 2, 3]
    from 1 to array length
      from 0 up to array length - starting index
      
    7. if a sub array sum is greater than or equal to the input integer return
       the length of that sub array
=end
NO_ARR = 0
def minSubLength(nums_arr, sum_num)
  arr_size = nums_arr.size
  
  1.upto(arr_size) do |sub_size|
    0.upto(arr_size - sub_size) do |start_idx|
      sub_arr = nums_arr[start_idx, sub_size]
      return sub_arr.size if sub_arr.sum >= sum_num
    end
  end
  
  NO_ARR
end

p minSubLength([2,3,1,2,4,3], 7) == 2
p minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p minSubLength([1, 2, 4], 8) == 0