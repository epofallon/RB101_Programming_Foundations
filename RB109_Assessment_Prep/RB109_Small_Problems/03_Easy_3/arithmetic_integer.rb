=begin
  - input: two positive integers
    ==> Enter the first number:
    23
    ==> Enter the second number:
    17
  - output: the results of operations
    - addition
    ==> 23 + 17 = 40
    - subtraction
    ==> 23 - 17 = 6
    - multiplication
    ==> 23 * 17 = 391
    - division
    ==> 23 / 17 = 1
    - modulo
    ==> 23 % 17 = 6
    - power
    ==> 23 ** 17 = 141050039560662968926103
  - explicit requirements:
    - don't validate input
    - execute all operations
  - implicit requirements:
    - output each operation in a string
      "`num1` `operation` `num2` = `answer`"
  
  - data structure:
    - an array for inputted numbers
    - an array for all operation symbols
    
  - algorithm:
  1. initialize operations array to hold all operation symbols
  2. initialize nums array to hold inputs as an empty array
  3. ask user for first number
    - push inputted integer to nums array
  4. ask user for second number
    - push inputted integer to nums array
  5. iterate through the operations array
    - assign answer to the result of performing operation
    - print "`num1` `operation` `num2` = `answer`"
=end

def prompt(string)
  puts "==> #{string}"
end

operations = [:+, :-, :*, :/, :%, :**]
nums = []

prompt "Enter the first number:"
nums << gets.chomp.to_i
prompt "Enter the second number:"
nums << gets.chomp.to_i

operations.each do |operation|
  answer = nums.reduce(operation)
  prompt "#{nums[0]} #{operation} #{nums[1]} = #{answer}"
end