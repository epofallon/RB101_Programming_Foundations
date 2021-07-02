=begin
- input: an array of integers 0 - 19 in numerical order
  - 
- output: an array of integers 0 - 19 in alphabetical order of their english equivalents
  - 
- explicit requirements: 
  - a new array
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
alphabetic_number_sort((0..19).to_a) == [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]
======================

- data structure:
  - an array to handle return
  - a hash to reference english with their integer equivalent
  
- algortihm:
  1. initialize hash of english / integers
  2. iterate through the input array of integers using sort_by
    3. have the block return the english equivalents of the input integers
    
  
=end

NUM_NAMES = %w(zero one two three four five 
               six seven eight nine ten
               eleven twelve thirteen fourteen fifteen
               sixteen seventeen eighteen nineteen)
              
def alphabetic_number_sort(num_arr)
  num_arr.sort do |num1, num2|
    NUM_NAMES[num1] <=> NUM_NAMES[num2]
  end
end

p alphabetic_number_sort((0..19).to_a) == [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]