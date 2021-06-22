=begin
- input: N/A
- output:
  - a string to the screen with an integer interpolated into it

- explicit requirements:
  - randomly generate Teddy's age between 20 and 200
- implicit requirements:
  - output a string that states 'Teddy is XX years old!'
  - output string includes integer for Teddy's age
  
  
  
- algorithm
1. Ask user for name
2. get input from user and assign to variable `name`
3. if `name` is an empty string, reassign to `Teddy`

1. generate a random number from 20 to 200
2. assign the variable `age` to the number
3. call puts on a string with the integer the variable age references interpolated in
=end
puts "What is your name?"
answer = gets.chomp

name = answer == '' ? 'Teddy' : answer

age = rand(20..200)

puts "#{name} is #{age} years old!"