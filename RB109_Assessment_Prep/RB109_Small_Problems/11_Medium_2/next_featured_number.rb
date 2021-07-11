=begin
- input: an integer
  - 
- output: the next featured number after it
  - an error message if there is no other featured number
- explicit requirements: 
  - 
- questions: 
  - what is a featured number?
    - an odd number
    - a multiple of 7
    - digits occur only once
- implicit requirements:
  - 
largest featured number --> 9_876_543_201
===== Test Cases =====
featured(12) == 21
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
======================

- data structure:
  - an integer
  
- algortihm:
  1. initialize a constant to the largest featured number 9_876_543_201
  2. return error if input number is >= the largest featured number
  3. find the first odd number divisible by 7 after the input number
    - loop starting at the input number
      - break if num is odd and divisble by 7
      - increment num by 1
    - return num
  4. loop to find first featured number
    - break if num has uniqe digits
    - iterate by 14
  5. return num
  
=end
LARGEST_FEATURED = 9_876_543_201

def start_num(num)
  loop do
    num += 1
    return num if num % 7 == 0 && num.odd?
  end
end

def featured(num)
  return 'There is no possible number that fulfills those requirements' if num >= LARGEST_FEATURED
  
  num = start_num(num)
  loop do
    break if num.to_s.chars == num.to_s.chars.uniq
    num += 14
  end
  
  num
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements