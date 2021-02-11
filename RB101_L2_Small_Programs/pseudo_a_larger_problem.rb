# => We're asking the user to give us N collections of numbers. We want to take the largest number out of each collection, and display it.

# High level pseudo-code
while user wants to keep going
  - ask the user for a collection of numbers
  - extract the largest one from that collection and save it
  - ask the user if they want to input another collection

return saved list of numbers

# translated into formal pseudo-code
START

SET large_numbers = []
SET keep_going = true

WHILE keep_going == true
  GET "enter a collection"
  SET collection
  SET largest_number = SUBPROCESS "extract the largest one from that collection"
  large_numbers.push(largest_number)
  GET "enter another collection?"
  IF "yes"
    keep_going == true
  ELSE
    keep_going == false
  if keep_going == false
    exit the loop
  
PRINT large_numbers

END