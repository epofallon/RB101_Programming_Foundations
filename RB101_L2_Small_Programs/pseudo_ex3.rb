# write out pseudo-code that does the following:

# =>  a method that takes an array of integers, and returns a new array with every other element

# casual pseudo-code
Given a collection of integers.
Define a result array

Iterate through the collection one by one.
  - if we are on an odd iteration
    - move to the next value in the collection
  - push the specific iteration of the collection into the result array

After iterating through the collection, return the result array

# formal pseudo-code
START

# Given a collectin of integers called "numbers"

SET result_array = a blank array
SET iterator = 0

WHILE iterator <= length of numbers
  IF current iteartion = odd number
    go to the next iteration
    
  Push current iteration of numbers into result_array
END