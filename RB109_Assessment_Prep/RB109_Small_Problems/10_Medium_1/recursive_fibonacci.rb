=begin
- input: 
  - 
- output: 
  - 
- explicit requirements: 
  - F(1) = 1
    F(2) = 1
    F(n) = F(n - 1) + F(n - 2) where n > 2
  1. They call themselves at least once. (fibonnaci will call twice) 
  2. They have a condition that stops the recursion. --> return 1 if n is <= 2
  3. They use the result returned by themselves.
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====

======================

- data structure:
  - 
  
- Algortihm:
  1. return 1 when n is less than 2
  2. call the fibonacci on n - 1 and n - 2
  
  
=end

def fibonacci(n)
  return 1 if n <= 2
  fibonacci(n - 1) + fibonacci(n - 2)
end

p fibonacci(1) #== 1
p fibonacci(2) #== 1
p fibonacci(3) #== 2
p fibonacci(4) #== 3
p fibonacci(5) #== 5
p fibonacci(12) #== 144
p fibonacci(20) #== 6765