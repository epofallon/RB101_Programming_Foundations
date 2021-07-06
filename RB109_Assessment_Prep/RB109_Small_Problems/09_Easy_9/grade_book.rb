=begin
- input: three integers
  - 
- output: a string
  - represents their letter grade
   0 -  59 --> 'F'
  60 -  69 --> 'D'
  70 -  79 --> 'C'
  80 -  89 --> 'B'
  90 - 100 --> 'A'
- explicit requirements: 
  - determine the mean score
  (75, 88, 75) -> 79.33 ('C')
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"
======================

- data structure:
  - integers and string
  
- algortihm:
  1. add the three numbers together and divide by 3.0 and assign to `grade`
  2. if less than 60 - 'F'
  3. if less than 70 - 'D'
  4. if less than 80 - 'C'
  5. if less than 90 - 'B'
  6. else - 'A'
  
=end

def get_grade(score1, score2, score3)
  grade = (score1 + score2 + score3) / 3.0
  
  case grade
  when 0..59 then 'F'
  when 60..69 then 'D'
  when 70..79 then 'C'
  when 80..89 then 'B'
  else 'A'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
p get_grade(75, 88, 75) == 'C'