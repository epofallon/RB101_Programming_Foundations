=begin
- input: a string
  - in "hh:mm" format
- output: integers
  - the minutes before midnight
  - the minutes after midnight
- explicit requirements:
  -
- questions:
  - 
- implicit requirements:
  -

===== Test Cases =====
after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0
======================

- data structure:
  - integers
  
- algortihm:
  1. initialize constant MINUTES_IN_DAY to 1440
  
  2. AFTER MIDNIGHT
    - seperate string by ':'
    - convert hours to minutes and add together with minuts from string
    - remainder of dividing total minutes by MINUTES_IN_DAY
  
  3. BEFORE MIDNIGHT
    - 
  
=end
MINUTES_IN_DAY = 1440

def after_midnight(time)
  hours, minutes = time.split(':').map(&:to_i)
  minutes = (Time.new(2000) + ( minutes + hours * 60 ) * 60).min
  
  
end

def before_midnight(time)
  # (MINUTES_IN_DAY - after_midnight(time)) % MINUTES_IN_DAY
end

p after_midnight('00:00') #== 0
p before_midnight('00:00') #== 0
p after_midnight('12:34') #== 754
p before_midnight('12:34') #== 686
p after_midnight('24:00') #== 0
p before_midnight('24:00') #== 0