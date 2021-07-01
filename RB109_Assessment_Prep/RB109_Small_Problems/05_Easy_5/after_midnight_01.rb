=begin
- input:
  - an integer representing the minutes before or after midnight
    - if the integer is positive, the time is after midnight
    - if the integer is negative, the time is before midnight
- output: a string
  - string is formatted "hh:mm"
- explicit requirements:
  - you may not use ruby's `Date` or `Time` classes
  - must work with any integer input
- questions:
  - 
- implicit requirements:
  - time displayed will go from "00:00" to "23:59"
  - convert every 60 minutes to an hour

===== Test Cases =====
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"
======================

- data structure:
  - integers
  
- algortihm:
  1. initialize hours and minutes to the return of dividing out the absolute value of the input integer by 60
  2. reassign hours to the remainder of dividing hours by 24
  3. if the input integer is positive
    return "hours:minutes" formatted to two digits
  4. if the input integer is negative
    return "23 - hours : 60 - minutes"
  
=end
def time_of_day(tot_mins)
  # hours, minutes = tot_mins.abs.divmod(60)
  # hours = hours % 24
  
  # if tot_mins < 0
  #   hours = 23 - hours
  #   minutes = 60 - minutes
  # end
  
  # format("%02d:%02d", hours, minutes)
  
  time = Time.new(2021, 7, 4) + (tot_mins * 60)
  time.strftime("%A %I:%M")
end


p time_of_day(-4231) #== "00:00"
# p time_of_day(-3) #== "23:57"
# p time_of_day(35) #== "00:35"
# p time_of_day(-1437) #== "00:03"
# p time_of_day(3000) #== "02:00"
# p time_of_day(800) #== "13:20"
# p time_of_day(-4231) #== "01:29"

