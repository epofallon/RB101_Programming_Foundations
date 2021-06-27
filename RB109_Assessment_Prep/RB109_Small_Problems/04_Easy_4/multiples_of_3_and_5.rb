=begin
- input: an integer
  - 
- output: an integer
  - the sum of the multiples of 3 or 5 between 1 and the input integer
  - 20 --> 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20)
- explicit requirements:
  - assume the input integer is greater than 1
- implicit requirements:
  - inclusive of the input integer

===== Test Cases =====
multisum(3) == 3   # (3)
multisum(5) == 8   # (3 + 5)
multisum(10) == 33 # (3 + 5 + 6 + 9 + 10)
multisum(1000) == 234168
======================

- data structure:
  - a range from 1 to the input number
  
- algortihm:
  1. initialize `sum` to 0
  2. iterate through a range from 1 to the input number
    3. if a number is divisible by either 3 or 5
      4. increment sum by it
  5. return `sum`
  
=end

def multisum(num)
  # sum = 0
  # (1..num).each do |n|
  #   if n % 3 == 0 || n % 5 == 0
  #     sum += n
  #   end
  # end
  # sum
  
  (1..num).select{ |n| n % 3 == 0 || n % 5 == 0 }.reduce(:+)
end

p multisum(3) == 3   # (3)
p multisum(5) == 8   # (3 + 5)
p multisum(10) == 33 # (3 + 5 + 6 + 9 + 10)
p multisum(1000) == 234168