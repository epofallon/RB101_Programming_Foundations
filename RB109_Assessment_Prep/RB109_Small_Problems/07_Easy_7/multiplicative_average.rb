=begin
- input: an array of integers
  - 
- output: a floating point number
  - 
- explicit requirements: 
  - multiply all the numbers together
  divide that result by the number of entries in the array
  prints rounded to 3 deciaml places
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
======================

- data structure:
  - 
  
- algortihm:
  1. reduce the array to the multiplicative sum
  2. divide it by the length of the array converted to a float
  3. puts it formatted to 3 deciaml places
  
=end

def show_multiplicative_average(arr)
  multi_avg = arr.reduce(:*) / arr.length#.to_f
  puts format('%0.3f', multi_avg)
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667