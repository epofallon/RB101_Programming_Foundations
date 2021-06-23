=begin
- input: two integers
  - first - the operand
  - second - what power we want to go to
- output:
  - an integer that is the result of taking the power to a number
- explicit requirements:
  - still use the multiply method
  - make `square` more specific
- implicit requirements:
  -

===== Test Cases =====
p square(5, 3) == 125
p square(2, 5) == 32
======================

square = num


- data structure:
  - integers
  
- algortihm:
  1. initialize result to num
  2. iterate `power` times
  3. call on num and result, and reassign result to the return
  4. return result
  
=end

def multiply(num1, num2)
  num1 * num2
end

def square(num, power)
  result = 1
  power.times { result = multiply(num, result) }
  result
end

p square(2, 5) == 32
p square(5, 3) == 125