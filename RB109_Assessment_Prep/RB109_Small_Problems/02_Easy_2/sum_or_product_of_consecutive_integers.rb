=begin
  - input: a string from the user, another string from the user
    - string represents an integer greater than 0
    - 's' for calculating the sum of 1 to the number. or 'p' for calculating the product of 1 to the number.
  - output:
    - the sum or product in a string
  - explicit requirements:
    - convert input string to an integer
  - implicit requirements:
    - output string will contain first number, second number, and sum/product
    - ignore input validation for now
  
  5
  s
  1-5 -sum-> 15
  
  6
  p
  1,2,3,4,5,6 -product-> 720
  
  data structure: range
  
  algorithm:
  1. ask user for a positive number greater than 0
  2. initialize `num` to the response converted from a string to an integer
  3. ask user for either `s` or `p` standing for sum or product
  4. if input is `s` assign :+ to `operator`
    - if input is `p` assign :* to `operator`
  5. call reduce on a sum from 1 to `num` inclusively and pass in the symbol `operand` references as an argument
  6. assign `opreation_type` to `sum` or `product`
=end
def integer?(num)
  num.to_i.to_s == num && num.to_i > 0
end

def get_number
  num = ''
  loop do
    puts ">> Please enter an integer greater than 0:"
    num = gets.chomp
    break if integer?(num)
    puts ">> #{num} is not a valid input."
  end
  num = num.to_i
end

def valid_input?(input, options)
  options.include?(input)
end

def pick_operation
  operation_input = ''
  loop do
    puts ">> Enter 's' to compute the sum, 'p' to compute the product."
    operation_input = gets.chomp.downcase
    break if valid_input?(operation_input, %w(s p))
    puts ">> #{operation_input} is not a valid input."
  end
  operation_input
end

def do_math(num, op)
  (1..num).reduce(op)
end

num = get_number
operation_input = pick_operation

if operation_input == 's'
  operation = :+
  operation_type = 'sum'
else
  operation = :*
  operation_type = 'product'
end

total = do_math(num, operation)

puts "The #{operation_type} of the integers between 1 and #{num} is #{total}."