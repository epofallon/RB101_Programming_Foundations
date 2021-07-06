=begin
- input: an integer
  - 
- output: an integer
  - the input integer doubled UNLESS it is a double number
- explicit requirements: 
  - 
- questions: 
  - What is a double number?
    - has an even number of digits
    - whose lef-side digits are exactly the same as the right-side digits
    - 44, 3333, 103103, 7676 are doubles
    - 444, 334433, and 107 are NOT doubles
- implicit requirements:
  - 

===== Test Cases =====

======================

- data structure:
  - 
  
- algortihm:
  1. if a double number
    2. return as is
  3. if not
    4. return 2 x the number
    
  Determine a double number
    convert to a string
    convert to an array of charachters
    split into two sub arrays representing each half
    check if halves are equal
  
=end

def double_num?(num)
  digits = num.to_s.chars
  half1, half2 = digits.partition.with_index { |_, idx| idx < digits.size / 2 }
  half1 == half2
end

def twice(num)
  double_num?(num) ? num : num * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10