=begin
- input: an integer
  - 
- output: an array of integers
  - 
- explicit requirements: 
  - first pass turn on every one 0 1 2 3 4
  - second pass toggle even switches 1 3
  - 3rd, 6th, 9th... 2
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
p toggle_lights(10) == [1, 4, 9]
======================

- data structure:
  - hash
  
- algortihm:
  1. initialize a hash with the default of :off
  2. iterate from 1 up to the input integer
    3. iterate from 0 up to the input integer - 1
      4. when the index number is divisible by the current round number
        5. flip it's status :on or :off
  
=end

def toggle_lights(lights)
  light_status = Hash.new(false)
  
  1.upto(lights) do |light_step|
    1.upto(lights) do |current_light|
      if (current_light) % light_step == 0
        light_status[current_light] = !light_status[current_light]
      end
    end
  end
  
  light_status.select { |_, value| value}.keys
end

p toggle_lights(1000) #== [1, 4, 9]