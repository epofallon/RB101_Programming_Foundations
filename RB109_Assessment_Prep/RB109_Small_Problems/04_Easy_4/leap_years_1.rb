=begin
- input: an integer
  - any year that is greater than 0
- output: a boolean
  - `true` when the input year is a leap year, false otherwise
- explicit requirements:
  - under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4 unless the year is also divisible by 100.
  - if the year is divisible by 100, it isn't a leap year unless the year is evenly divisible by 400.
  - the above rules are good for any year greater than 0.
- implicit requirements:
  --> divisible by `4`
  --> divisible by `4`, `100`, and `400`
  
  --> not divisible by `4`
  --> divisible by `4`, and `100`, but not `400`
  
===== Test Cases =====
leap_year?(2016) == true    `
leap_year?(2015) == false   
leap_year?(2100) == false   
leap_year?(2400) == true    
leap_year?(240000) == true  
leap_year?(240001) == false
leap_year?(2000) == true    
leap_year?(1900) == false   
leap_year?(1752) == true    
leap_year?(1700) == false   
leap_year?(1) == false      
leap_year?(100) == false    
leap_year?(400) == true     
======================

- data structure:
  - a controll expression
  
- algortihm:
  1. if `year` is divisible by `400` --> true
  2. if `year' is divisible by `100` --> false
  3. if `year` is divisible by `4`   --> true
  4. else                            --> false
  
=end
def leap_year?(year)
  case 
  when year % 400 == 0 then true
  when year % 100 == 0 then false
  else year % 4 == 0
  end
end

def reverse_leap?(year)
  if year % 4 == 0 && year % 100 != 0
    true
  elsif year % 100 && year % 400 != 0
    false
  else
    year % 400 == 0
  end
      
end

p reverse_leap?(2016) == true
p reverse_leap?(2015) == false
p reverse_leap?(2100) == false
p reverse_leap?(2400) == true
p reverse_leap?(240000) == true
p reverse_leap?(240001) == false
p reverse_leap?(2000) == true
p reverse_leap?(1900) == false
p reverse_leap?(1752) == true
p reverse_leap?(1700) == false
p reverse_leap?(1) == false
p reverse_leap?(100) == false
p reverse_leap?(400) == true

