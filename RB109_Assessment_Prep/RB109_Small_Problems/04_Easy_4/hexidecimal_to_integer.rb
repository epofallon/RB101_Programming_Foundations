=begin
- input:
  - a string representing a hexidecimal number
- output:
  - it's integer equivalent
- explicit requirements:
  - cannot use any built in functions
- implicit requirements:
  -

===== Test Cases =====
hexadecimal_to_integer('4D9f') == 19871
======================

- data structure:
  - an array
  
- algortihm:
  1. initialize a hash with hexidecimal keys and integer values
  2. convert string input into an array of charachters
  3. convert array of charachters to array of integer equivalents
  4. initialize `value` to 0
  5. initialize `power` to array.length - 1
  6. iterate through array of integer equivalents
    7. reassign value to value + num * 16 ** power
    8. decrement power by 1
  9. return value
  
  4D9F --> [4 * 16^3] + [13 * 16^2] + [9 * 16^1] + [15 * 16^0]
            16384        3328          144          15
=end

H_TO_I ={'0' => 0,'1' => 1,'2' => 2,'3' => 3,'4' => 4,'5' => 5,'6' => 6,'7' => 7,'8' => 8,'9' => 9,'A' => 10,'B' => 11,'C' => 12,'D' => 13,'E' => 14,'F' => 15}

def hexadecimal_to_integer(str)
  digits = str.chars.map { |char| H_TO_I[char.upcase] }
  
  value = 0
  power = digits.size - 1
  digits.each do |digit| 
    value += digit * (16 ** power)
    power -= 1
  end
  value
end

p hexadecimal_to_integer('E7A9') #== 19871