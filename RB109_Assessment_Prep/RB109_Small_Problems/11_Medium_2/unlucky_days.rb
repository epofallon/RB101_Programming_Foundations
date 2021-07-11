=begin
- input: an integer
  - a year after 1752
- output: an integer
  - the number of friday the 13ths in that year
- explicit requirements: 
  - after 1752
  - gregorian calendar
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2
======================

- data structure:
  - 
  
- algortihm:
  - initialize fri_13s to 0
  1. from months 1 - 12
    2. count the number of times the 13th is a friday
    - if the 13th of the current month is a friday
      - increment fri_13s by 1
  
=end

# def friday_13th(year)
#   fri_13s = 0
  
#   1.upto(12) do |month|
#     fri_13s += 1 if Time.new(year, month, 13).friday?
#   end
  
#   fri_13s
# end

# p friday_13th(2015) == 3
# p friday_13th(1986) == 1
# p friday_13th(2019) == 2

# find the first friday of the year
# initialize a months hash with default set to 0
# iterate every 7 days
  # break when the day is greater than or equal to the first day of the next year
  # increment the month of that current friday
# select only months with 5 fridays
# return month names

require 'date'

def first_friday(year)
  day = Date.new(year, 1, 1)
  loop do
    break if day.friday?
    day += 1
  end
  day
end

def fridays_in_months(year)
  day = first_friday(year)
  num_fridays = Hash.new(0)
  
  loop do
    break if day.year > year
    num_fridays[day.strftime("%B")] += 1
    day += 7
  end
  
  num_fridays
end

def five_friday_months(year)
  fridays_in_months(year).select { |_month, num_fris| num_fris == 5 }.keys
end

p five_friday_months(2021) == ["January", "April", "July", "October", "December"]