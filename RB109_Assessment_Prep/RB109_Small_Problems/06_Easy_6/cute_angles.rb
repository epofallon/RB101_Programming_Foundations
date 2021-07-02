=begin
- input: a floating point number
  - Represents an agle between 0 and 360 degrees
- output: a string
  - Represents the angle in degrees, minutes and seconds.
- explicit requirements: 
  - use ° to represent degrees
  - use ' to represent minutes
  - use " to represent seconds
  - a degree has 60 minute, while a minute has 60 seconds
  - use two digit numbers with leading zeros when formatting minutes and seconds
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
             76
0.73 * 60 -> 43(.8)
0.8  * 60 -> 48
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
======================

- data structure:
  - floats and strings
  
- algortihm:
  1. reassign `degrees` and initialize `mintues` to the result and remainder of `degrees` divided by 1
  2. multiply `minutes` by 60 and reassign
  3. reassign `minutes` and initialize `seconds` to the result and remainder of `minutes` divided by 1
  4. multiply `seconds` by 60 and reassign
  5. contat together the string
  
=end
DEGREE = "\xC2\xB0"

def dms(degrees)
  degrees, minutes = degrees.divmod(1)
  minutes *= 60
  minutes, seconds = minutes.divmod(1)
  seconds *= 60
  %(#{degrees}#{DEGREE}#{format("%02d",minutes)}'#{format("%02d",seconds)}")
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) #== %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")