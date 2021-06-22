=begin
- input: an array of integers
- output: an integer

- explicit requirements:
  - output integer is the average of the integers in the input array
  - the array will never be empty
  - the integers in the input array will always be positive
- implicit requirements:
  - use integer division to get whole numbers
  
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

- data structure:
  - an array

- algorithm:
  1. initialize the variable `sum` to 0
  2. iterate through the array, passing each element to a block
    A. add each element to the `sum` variable and reassign `sum` to the return
  3. divide the integer `sum` references by the length of the array

=end

def average(arr)
  arr.reduce(:+) / arr.size.to_f
end

puts average([1, 6]) #== 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) #== 25
puts average([9, 47, 23, 95, 16, 52]) #== 40