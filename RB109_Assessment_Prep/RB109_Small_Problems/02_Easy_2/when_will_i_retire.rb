=begin
- input:
  - a string inputted by user representing current age
  - a string inputted by user representing retirement age
  - input example:
      What is your age? 30
      At what age would you like to retire? 70
- output:
  - a string stating the current year and what year to retire
  - another string saying how many years of work left
  - output example:
      It's 2016. You will retire in 2056.
      You have only 40 years of work to go!
- explicit requirements:
  - get input on current age
  - get input on retirement age
  - have current year
  - calculate retirement year
  - caluclate difference.=
- implicit requirements: 
  - use `print` method when getting inputs
  - include a blank space between inputs and outputs
  - use `puts` for outputs

example inputs --> 30, 70
example outputs --> 2021, 2061, 40

integers for inputs and use time for years

algorithm:
  1. ask user for current age
    1A. assign `current_age` to input, converting it to integer
  2. ask user for desired retirement age
    2A. assign `retire_age` to input, converting it to integer
  3. Subtract the current age from the retirement age to get years to go
  4. Assign current_year to this year
  5. Assign retirement_year to current_year + years_to_go
  6. Output string with current_year and retire_year
  7. Output string with years_to_go
  
=end

print 'What is your age? '
current_age = gets.chomp.to_i

print 'At what age would you like to retire? '
retire_age = gets.chomp.to_i

years_to_go = retire_age - current_age
current_year = Time.now.year
retire_year = current_year + years_to_go

puts ''
puts "It's #{current_year}. You will retire in #{retire_year}."
puts "You have only #{years_to_go} years of work to go!"