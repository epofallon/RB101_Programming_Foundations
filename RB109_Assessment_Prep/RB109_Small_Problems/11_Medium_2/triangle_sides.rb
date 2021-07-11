=begin
- input: 3 integers
  - represent the three sides of a triangle
- output: 
  - :equilateral, :isosceles, :scalene, or :invalid
- explicit requirements: 
  - :equilateral --> all 3 sides are the same length
  - :isosceles --> 2 sides are of equal length, while the 3rd side is different
  - :scalene --> all 3 sides are different lengths
  - :invalid --> cannot have a side be 0
                 largest side cannot be greater than the sum of the two shorted sides
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid
======================

- data structure:
  - an array of 3
  
- algortihm:
  1. initialize trianlge array to all 3 input sides in an array
  2. if the triangle contains 0 OR the largest is greater than the sum of the two smaller sides
    :invalid
  3. if the triangle returns a uniq of 3 
    :scalene
  2. 2
    :isosceles
  5. 1
    :equilateral
  
=end

def triangle(s1, s2, s3)
  sides = [s1, s2, s3]
  
  return :invalid if sides.include?(0) || sides.max > sides.min(2).sum
  
  case sides.uniq.size
  when 1 then :equilateral
  when 2 then :isosceles
  when 3 then :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid