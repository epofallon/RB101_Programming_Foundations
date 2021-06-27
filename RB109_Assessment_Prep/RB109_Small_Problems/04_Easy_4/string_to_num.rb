=begin
- input: a string
  - string is of digits
- output: an integer
  - integer version of the input string of digits
- explicit requirements:
  - cannot use String#to_i or Integer()
  - don't worry about the + or - signs
  - don't worry about invalid inputs, assume all charachters are numeric
  - method must go the old fashioned way
- implicit requirements:
  -

===== Test Cases =====
string_to_integer('4321') == 4321
string_to_integer('570') == 570
======================
(4 * 10) 3 times(arr.length - 1)
(3 * 10) 2 times(arr.length - 2)
(2 * 10) 1 times(arr.length - 3)
(1 * 10) 0 times(arr.length - 4)
4000 + 300 + 20 + 1
  0     1     2   3 

- data structure:
  - an array to convert
  
- algortihm:
  1. initialize a constant Hash with string keys and integer values
  2. convert string to an array of charachters
  3. iterate through array of charachters and transform to integers
  
  4. add the right number of zeros to each element
    5. multiply an element
    
    (4 - 1) times do
      arr[0] *= 10
    end
    
    (4 - 2) times do
      arr[1] *= 10
    end
    
    (4 - 3) times do
      arr[2] *= 10
    end
=end

S_TO_I = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9}

def string_to_integer(str)
  digits = str.chars.map{ |char| S_TO_I[char]}
  
  # digits.each_index do |index|
  #   (digits.size - (index + 1)).times{ digits[index] *= 10}
  # end.sum
  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570