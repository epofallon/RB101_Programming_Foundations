=begin
- input: an array of arrays
  - each sub array is a two element array with the type of fruit and the quantity
- output: 
  - an array of the correct number of each fruit listed out
- explicit requirements: 
  - if we have ['apples', 3] ==> ['apples', 'apples', 'apples']
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
======================

- data structure:
  - an array of arrays that will get flattened
  
- algortihm:
  1. iterate through the outer array using map
    2. pop out the number from each sub array
    3. multiply the sub array by the popped number
  4. flatten the returned array of arrays
  
=end

def buy_fruit(fruits)
  fruits.map do |fruit_arr|
    quantity = fruit_arr.pop
    fruit_arr * quantity
  end.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]