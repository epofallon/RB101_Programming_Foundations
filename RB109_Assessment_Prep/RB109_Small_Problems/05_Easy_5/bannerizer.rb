=begin
- input: 
  - a string
- output: 
  - the input text in abox.
- explicit requirements: 
  - 
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

print_in_box('')
+--+
|  |
|  |
|  |
+--+
======================

- data structure:
  - strings
  
- algortihm:
  1. print the top line
    - plus minues plus
  2. print the spacer line
    - line space line
  3. print the middle line
    - line space text space line
  
=end
def print_in_box(string)
  size = string.length
  return "Error message must be 80 charachters or less. Yours is #{size}." if size > 80
  puts "+-#{'-' * size}-+"
  puts "| #{' ' * size} |"
  puts "| #{string} |"
  puts "| #{' ' * size} |"
  puts "+-#{'-' * size}-+"
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')

'hello my name is eugene ofallon and I aim to become a software engineer before the end of 2022'