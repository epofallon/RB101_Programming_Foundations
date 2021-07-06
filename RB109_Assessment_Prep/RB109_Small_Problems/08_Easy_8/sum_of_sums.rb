=begin
- input: an array of numbers
  - 
- output: a integer
  - the sum of the sums of each leading subsequence of the array
  [3, 5, 2]
  [3] + [3, 5] + [3, 5, 2]
- explicit requirements: 
  - the array will always contain at least one integer (don't worry about empty array edge case)
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35
======================

- data structure:
  - an integer
  
- algortihm:
  1. initialize sum as 0
  2. from length 1 upto the length of the input array
    3. slice the sub array
    4. sum the sub array
    5. increment `sum` by that sub array's sum
  
=end
def sum_of_sums(arr)
  sum = 0
  
  1.upto(arr.size) do |sub_size|
    sum += arr[0, sub_size].sum
  end
  
  sum
end


p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35