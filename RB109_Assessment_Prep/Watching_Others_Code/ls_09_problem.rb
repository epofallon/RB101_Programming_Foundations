=begin
  You are going to be given an array of integers. Your job is to take that array and find
  an index N where the sum of the integers to the left of N is equal to the sum of the
  integers to the right of N. If there is no index that would make this happen, return -1.
  
  [1, 2, 3, 4, 3, 2, 1] --> index 3 (value 4) both sides of this index have an equal value.
  
  [20, 10, -80, 10, 10, 15, 35] --> index 0 (value 20). [] & [10, -80, 10, 10, 15, 35] have the same value 0
  
  
  - go through the array, starting at index 0
  - find the sum of integers to the left side of the array
  - find the sum of integers to the right side of the array
  - if they are equal, return the index
    - (empty arrays are equal to 0 in this problem)
    - if not, move on to the next index
  
  - index 0
    - left_array = [] .. 0
    - right_array = arr[1]..arr.last
    
  - index 1
    - left_array = arr[0]
    - right_array = arr[1]..arr.last
    
  left_array = arr[0]..arr[n-1]
  right_array = arr[n+1]..arr.last
=end
require 'pry'
def find_even_index(arr)
  n = 0
  # binding.pry
  loop do
    
    if n == 0
      left_array = []
    else
      left_array = arr[0..(n-1)]
    end
    
    right_array = arr[(n+1)..(arr.size - 1)]
    
    left_sum = 0
    right_sum = 0
    left_sum = left_array.reduce(:+) unless left_array.empty?
    right_sum = right_array.reduce(:+) unless right_array.empty?
    
    if left_sum == right_sum
      return n
    else
      n += 1
    end
    break if n == arr.size
    
  end
  -1
end


p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3