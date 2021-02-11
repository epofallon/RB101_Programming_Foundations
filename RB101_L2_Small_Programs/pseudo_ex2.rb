# write out pseudo-code that does the following:

# =>  a method that takes an array of strings, and returns a string that is all those strings concatenated together

# Casual Pseudo-Code
define a method that accepts an array
  - set a variable equal to nil
  - iterate through the array
    - push each string onto the end of the variable
  
  - After iterating through the array return the variable
  
# Formal Pseudo-Code
START

define a method that accepts one argument (array)
  SET sum_string = nil
  WHILE we iterate through array
    SET string = each value within array one at a time
    sum_string = sum_string + string
    
  return sum_string

END