=begin
- input: an array
  - 
- output: a new array
  - has the elements from the original array in reverse order
- explicit requirements: 
  - cannot modify the original list
  
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b e d c)) == %w(c d e b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
list.object_id != new_list.object_id  # => true
list == [1, 3, 2]                     # => true
new_list == [2, 3, 1]                 # => true
======================

- data structure:
  - arrays
  
- algortihm:
  1. initialize `rev_arr` to an empty array
  2. begin iterating through the input array
    3. unshift the elements into `rev_arr`
  4. return `rev_arr`
  
=end

def reverse(arr)
  arr.reduce([]) { |rev_arr, element| [element] + rev_arr }
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true