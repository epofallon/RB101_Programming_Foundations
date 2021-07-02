=begin
- input: an array
  - 
- output: the same array object
  - elements reversed in place
- explicit requirements: 
  - you cannot use Array#reverse or Array#reverse!
- questions: 
  - 
- implicit requirements:
  - elements can be any objects
  - 

===== Test Cases =====
list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
list == ["abc"] # true

list = []
reverse!(list) == [] # true
list == [] # true
======================
 0  1  2  3  4
-5 -4 -3 -2 -1
- data structure:
  - 
  
- algortihm:
  1. initialize front_idx to 0
  2. initialize back_idx to the length of the array - 1
  3. begin a loop
    swap the elements at front_idx and back_idx
    break when the front_idx == the length of the array / 2 - 1
    increment front_idx + 1
    increment back_idx - 1
  
=end

def reverse!(arr)
  front_idx = 0
  back_idx = arr.size - 1
  
  loop do
    break if front_idx > (arr.size / 2) - 1
    arr[front_idx], arr[back_idx] = arr[back_idx], arr[front_idx]
    front_idx += 1
    back_idx -= 1
  end
  
  arr
end

list = [1, 2, 3, 4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true