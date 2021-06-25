=begin
- input:
  - an array
- output:
  - an array that contains every other element of the input array
- explicit requirements:
  - 1st, 3rd, 5th, 7th, ... positions
  - return a new array
- implicit requirements:
  - every other means elements at index: 0, 2, 4, 6, ...
  - an empty array returns an empty array

===== Test Cases =====
oddities([2, 3, 4, 5, 6])    == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def'])     == ['abc']
oddities([123])              == [123]
oddities([])                 == []
======================

- data structure:
  - a new array
  
- algortihm:
  1. initialize `result` as an empty array
  2. initialize counter as 0
  3. call the loop method
    A. push arr[counter] to result
    B. iterate counter by 2
    C. break when counter >= length of input array
  4. return `result`
    
  
=end
def oddities(arr)
  # arr.select.with_index {|element, index| index.even? }
  result = []
  counter = 0
  loop do
    break if counter >= arr.size
    result << arr[counter]
    counter += 2
    
  end
  result
end

def even_stevens(arr)
  arr.select.with_index {|element, index| index.odd? }
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
