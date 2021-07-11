=begin
- input: an integer
  - the 'nth' Fibonacci number
- output: 
  - the last digit of that 'nth' fibonacci number
- explicit requirements: 
  - 
- questions: 
  - 
- implicit requirements:
  - 
1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584 4181 6765 10946 17711 28657
1 1 2 3 5 8  3  1  4  5  9   4   3   7   0   7    7    4    1    5
1 2 3 4 5 6  7  8  9 10 11  12  13  14  15  16   17   18   19   20    21    22    23

0
1 
2
3 
4
5
6
7
8
9

===== Test Cases =====

======================

- data structure:
  - 
  
- algortihm:
  1. get `nth` fibonacci number
  2. convert to a string
  3. return the last charachter in the string converted back to an integer
  
=end

def fibonacci(n)
  first = 1
  second = 1
  
  3.upto(n) { second, first = [first, first + second] }
  
  first
end

# def fibonacci_last(nth)
#   last_2 = [1, 1]
#   3.upto(nth) do
#     last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
#   end

#   last_2.last
# end
FIB_PATTERN = '011235831459437077415617853819099875279651673033695493257291'

def fibonacci_last(number)
  nth_position = number % 60
  p nth_position
  FIB_PATTERN[nth_position]
end

fibonacci_last(123_456_789_987_745) # -> 5
fibonacci_last(59)        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
fibonacci_last(123456789) # -> 4