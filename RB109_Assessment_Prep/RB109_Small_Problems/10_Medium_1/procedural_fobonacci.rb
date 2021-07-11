=begin
- input: an integer
  - the `nth` fibonacci number
- output: an integer
  - the value of the `nth` fibonacci number
- explicit requirements: 
  - not recursive
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====

======================

- data structure:
  - integer
  
  f[n] = f[n-1] + f[n-2]
  
- algortihm:
  1. set n_1 to 1
  2. set n_2 to 1
  3. set n_0 to nil
  3. iterate from 3 to n 
    4. set n_0 to n_1 plus n_2
    5. set n_2 to n_1
    6. set n_1 to n_0
  8. return n_0
    
  
=end

def fibonacci(n)
  first = 1
  second = 1
  
  3.upto(n) { second, first = [first, first + second] }
  
  first
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501