=begin
- inputs: range from 1 to 99
- outputs: the odd numbers on new lines from 1 to 99 inclusive

- data structure: a range

- algorithm:
  1. iterate through the range 1 to 99
  2. output to the screen if the number is odd
  
=end

1.upto(99){ |num| puts num if num.even? }