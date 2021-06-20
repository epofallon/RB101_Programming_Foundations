=begin
  - Input: A single integer
    - Can be positive, negative, or zero
  - Output:
    - `true` if the input integer's absolute value is odd
    - `false` otherwise
  - Explicit Requirements:
    - Input is always a valid integer
  - Implicit Requirements:
    - 
  
  puts is_odd?(2)    # => false
  puts is_odd?(5)    # => true
  puts is_odd?(-17)  # => true
  puts is_odd?(-8)   # => false
  puts is_odd?(0)    # => false
  puts is_odd?(7)    # => true
  
  Integer is the only needed data structure
  
  1. Get absolute value of input integer
  2. Check to see if absolut value of integer is false
    - If absolute value of integer is odd, return `true`
    - If absolute value of integer is even, return `false`
    
  
=end

def is_odd?(num)
  num.abs.remainder(2) == 1 
end

puts is_odd?(2)   == false
puts is_odd?(5)   == true
puts is_odd?(-17) == true
puts is_odd?(-8)  == false
puts is_odd?(0)   == false
puts is_odd?(7)   == true