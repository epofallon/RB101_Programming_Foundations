=begin
  - input:
    - an integer --> the bill amount
    - an integer --> the tip rate
  - output: to the screen the tip amount and the total bill amount
    - an integer --> the total tip
    - an integer --> the total bill amount
  - explicit requirements:
    - compute the tip and the total bill amounts
  - implicit requirements:
    - the tip rate is input as a percentile
      - the math will need the decimal amount ranging from 0.0 to 1.0
    - New lines are not used when asking for inputs
      - print or p not puts
  
  Inputs:
    What is the bill? 200
    What is the tip percentage? 15
  Outputs:
    The tip is $30.0
    The total is $230.0
    
  floats to handle numbers
  
  algorithm:
  1. ask user for the bill amount & assign `bill` to input
    - convert input into a numeric
  2. as user for the tipe rate & assign to `tip_rate`
    - convert input into a numeric
  3. convert tip rate to decimal
  4. assign `tip_amount` to multiplying `bill` by the `tip rate`
  5. output the tip amount
  6. add the tip amount to the bill
  7. output the total bill amount
=end

print 'What is the bill? '
bill = gets.chomp.to_f

print 'What is the tip percentage? '
tip_rate = gets.chomp.to_f

tip_rate /= 100
tip_amount = bill * tip_rate

puts ''
puts "The tip is $#{format('%0.2f', tip_amount)}"
puts "The total is $#{format('%0.2f', bill + tip_amount)}"
