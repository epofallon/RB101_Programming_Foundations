=begin
- input: an integer
  - 
- output: an integer
  - the square of the sum of the first `n` positive integers - the sum of the squares of the first n positive integers
- explicit requirements: 
  - sum from 1 to the input integer, then square it
  - square every number from 1 to the input integer, then sum it
- questions: 
  - 
- implicit requirements:
  - can assume no 0 input or negative

===== Test Cases =====
sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sum_square_difference(10) == 2640
sum_square_difference(1) == 0
sum_square_difference(100) == 25164150
======================

- data structure:
  - an array from 1 to the input integer
  
- algortihm:
  1. initialize sum_square to (1..n).sum ** 2
  2. initialize square sums to (1..n).map{|n| n*n}.sum
  3. return sum_square - square_sum
=end

def sum_square_difference(num)
 ((1..num).sum ** 2) - ((1..num).map { |n| n*n }.sum)
end

p sum_square_difference(3) == 22
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150