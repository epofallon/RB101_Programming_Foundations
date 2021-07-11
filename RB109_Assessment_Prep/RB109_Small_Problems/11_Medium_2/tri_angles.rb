=begin
- input:  3 integers
  - the angles of a trianlge
- output: :acute, :right, :obtuse, :invalid
  - :acute --> all angles are less than 90 degrees
  - :right --> an angle is 90 degrees
  - :obtuse --> an angle is larger than 90 degrees
  - :invalid --> all angles must be greater than 0
                 all angles must sum up to 180
- explicit requirements: 
  - degrees and integers
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
triangle(60, 70, 50) == :acute
triangle(30, 90, 60) == :right
triangle(120, 50, 10) == :obtuse
triangle(0, 90, 90) == :invalid
triangle(50, 50, 50) == :invalid
======================

- data structure:
  - an array of angles
  
- algortihm:
  1. initialize `angles` to an array containing the 3 input angles
  2. return :invalid if the array includes 0 or doesn't sum to 180
  3. return :right if the triangle includes 90
  4. return :obtuse if any angle is over 90
  5. return :acute if no angle is equal to or over 90
  
=end

def triangle(a1, a2, a3)
  angles = [a1, a2, a3]

  case
  when  angles.sum != 180, angles.include?(0) then :invalid
  when angles.include?(90) then :right
  when angles.max > 90 then :obtuse
  when angles.max < 90 then :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid