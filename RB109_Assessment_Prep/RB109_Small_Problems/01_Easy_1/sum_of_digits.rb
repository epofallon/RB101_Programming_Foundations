=begin
  - input: a positive integer
  - output: an integer
  - explicit requirements:
    - ouput integer is the sum of the digits of the input integer
    - input integer is positive
    - Don't use basic looping constructs (while, until, loop and each)
  - implicit requirements:
    - the integer 0 will return 0
    - the integer will have at least one digit
  
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

  - data structure:
  an array
  
  - algorithm:
  1. convert the input integer into a string
  2. split the string into an array of charachters
  3. transform each element of the array from a string to an integer
  4. sum the elements of the array
=end

def sum(num)
  num.to_s.split('').map(&:to_i).reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45