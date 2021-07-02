=begin
- input: 
  - 
- output: 
  - 
- explicit requirements: 
  - 
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====

======================

- data structure:
  - 
  
- algortihm:
  1. 
  
=end

# def include?(arr, search_value)
#   arr.any?(search_value)
# end
require 'pry'

def include?(array, search)
  binding.pry
  array << search
  return true if array.uniq! != nil
  false
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false