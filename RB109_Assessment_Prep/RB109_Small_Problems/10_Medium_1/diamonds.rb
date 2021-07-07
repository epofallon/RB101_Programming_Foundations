=begin
- input: an integer
  - represents the size of a diamond
- output: to the screen
  - a diamond with the width and height of the input number
- explicit requirements: 
  - the input is an odd integer
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
diamond(1)
*

diamond(9)
    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *
======================

- data structure:
  - strings
  
- algortihm:
  1. from 1 up to the input integer, odds only
    2. print '*' multiplied by the current number centered in space
  3. from input integer - 1 downto 1
    4. do the same
    
  Make a line
    - input: the input integer, the current integer
    - '*' multiplied by the curren integer
    - center this in the width of the input integer
  
=end

def print_line(width, num_stars)
  diamonds = ' ' * num_stars
  diamonds[0] = '*'
  diamonds[-1] = '*'
  puts diamonds.center(width)
end

def diamond(width)
  1.upto(width) { |stars| print_line(width, stars) if stars % 2 != 0 }
  (width - 1).downto(1) { |stars| print_line(width, stars) if stars % 2 != 0 }
end

diamond(1)
diamond(5)
diamond(9)