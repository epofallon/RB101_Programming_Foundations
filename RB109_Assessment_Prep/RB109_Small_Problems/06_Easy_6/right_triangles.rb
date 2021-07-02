=begin
- input: an integer
  - 
- output: 
  - a triangle of stars
- explicit requirements: 
  - sides have `n` stars.
  - the hypotenuse of the triangle goes from lower left to upper right
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
triangle(5)

    *
   **
  ***
 ****
*****
======================

- data structure:
  - a string and an integer
  
- algortihm:
  1. from 1 upto the input integer
    2. multiply '*' by the current integer
    3. right justify the string by the input integer
    4. puts the string
  
=end

def triangle(height)
  1.upto(height) do |num|
    level = '*' * num
    puts level.rjust(height)
  end
end

triangle(5)
triangle(9)