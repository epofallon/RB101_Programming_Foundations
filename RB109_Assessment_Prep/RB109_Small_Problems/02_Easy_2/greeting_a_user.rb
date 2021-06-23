=begin
  - input: a string
    - input from user, represents name
  - output: a string
    - string is a greeting using the user's name
    - a different string will be outputted if the user includes a `'!'` in their name
  - explicit requirements:
    - program checks for the presence of a `!` in the input string
    - program resonds differently depending on if there is a `!` in the input string
  - implicit requirements:
    - Inputs string --> "What is your name? "
      - use `print` rather than `puts` to keep the same line
    - Output strings --> "Hello name."
                         "HELLO NAME. WHY ARE WE SCREAMING?"
  
  data structure: strings - some conditional branching
  
  algorithm:
  1. as user for name
  2. initialize `name` variable to the user inputted string
  3. check to see if inputted string has `!` in it
    3A. If it does, output remove the exclamation point, uppercase the name and output "HELLO NAME. WHY ARE WE SCREAMING?"
    3B. If it does not, output "Hello #{name}."
  
=end

print "What is your name? "
name = gets.chomp!

if name[-1] == '!'
  name.chop!
  puts "HELLO #{name.delete('!').upcase}. WHY ARE WE SCREAMING?"
else 
  puts "Hello #{name}."
end