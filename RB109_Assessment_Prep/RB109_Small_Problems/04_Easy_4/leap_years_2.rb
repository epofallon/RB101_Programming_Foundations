=begin
- input:
  -
- output:
  -
- explicit requirements:
  - prior to 1752, the Julian Calendar was used
    - If a year was divisible by 4, it was a leap year
- implicit requirements:
  -

===== Test Cases =====

======================

- data structure:
  - 
  
- algortihm:
  1. if year is less than 1752, call julian_leap?, otherwise call gregorian_leap?
  
=end

def leap_year?(year)
  case 
  when year < 1752 && year % 4 == 0 then true
  when year % 400 == 0 then true
  when year % 100 == 0 then false
  else year % 4 == 0
  end
end

def julian_leap?(year)
  year % 4 == 0
end

# def leap_year?(year)
#   year < 1752 ? julian_leap?(year) : gregorian_leap?(year)
# end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true 
p leap_year?(400) == true