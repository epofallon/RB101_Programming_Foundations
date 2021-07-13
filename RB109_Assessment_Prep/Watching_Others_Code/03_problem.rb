# You have to create a method thata takes a positive integer number and return the next bigger number formed by the same digits:

# 12 --> 21
# 513 --> 531
# 2017 --> 2071

# If no bigger number can be composed using those digits return -1
# 9 --> -1
# 111 --> -1
# 531 --> -1

=begin
- input: an integer
- output: an integer
  - next bigger number with the same digits
- implicit requirements:
  - no negative numbers
  - next bigger number is not always the biggest possible number
- explicit requirements:
  - return -1 if there is no next bigger number with the same digits
- data structure
  - an array of characters
- algorithm
  - convert integer to string then to array of charachters
  - check if the input digits are the largest possible

- next_num to num
- iterate
  - break if next_num has the same digits as the input number
  - increment + 1
=end
def biggest_num(num)
  num.to_s.chars.sort.reverse.join.to_i
end

def next_bigger_num(num)
  digits = num.to_s.chars
  max_num = digits.sort {|a, b| b <=> a}
  
  return -1 if digits == max_num
  
  loop do
    num += 1
    break if num.to_s.chars.sort == digits.sort
  end
  
  num
end

p next_bigger_num(12) == 21
p next_bigger_num(2017) == 2071
p next_bigger_num(513) == 531

p next_bigger_num(9) == -1
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1

p next_bigger_num(123456789) == 123456798
