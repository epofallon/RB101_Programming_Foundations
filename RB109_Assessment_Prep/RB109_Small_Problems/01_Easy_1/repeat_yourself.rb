=begin
  - Write a method that takes two arguments
    - Inputs: a string & a positive integer
    - Outputs: the input string the number of times the input integer indicates
    - Explicit Rules:
      - Integer input is positive
      - First input is a string
      - Method will output to the screen
    - Implicit Rules:
      - Method will loop

  repeat('Hello', 3)
  --> Hello
      Hello
      Hello
  
  A string and an integer are the data structures needed
  
  1. Begin iterating with a block
    2. Output the string to the screen
    3. Repeat the number of times the integer indicates
  
=end

def repeat(str, num)
  num.times { puts str }
end

repeat('Hello', 3)