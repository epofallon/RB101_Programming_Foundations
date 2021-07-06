=begin
- input: an integer
  - 
- output: integer with the reverse digits
  - 
- explicit requirements: 
  - don't worry about leading zeros
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # No leading zeros in return value!
reversed_number(12003) == 30021
reversed_number(1) == 1
======================

- data structure:
  - a string
  
- algortihm:
  1. convert integer to string
  2. reverse string
  3. convert string to integer
  
=end

def reversed_number(num)
  num.to_s.reverse.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1