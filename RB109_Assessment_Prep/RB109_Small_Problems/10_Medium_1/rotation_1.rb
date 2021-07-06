=begin
- input: an array
  - of any object
- output: a new array
  - the first element in the input array is now the last element in the output array
- explicit requirements: 
  - cannot use `Array#rotate(!)
  - cannot mutate the array
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true
======================

- data structure:
  - an array
  
- algortihm:
  1. initialize `rotated_arr` to an empty array
  2. iterate through the input array in reverse order
    3. if `rotated_arr` is one less than length of the input array
      4. push the last element to the back of `rotated_arr`
    5. else prepend the elements to the front of `rotated_arr`
  6. return `rotated_arr`
=end

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
  # rotated_arr = []
  # arr.reverse_each do |element|
  #   if rotated_arr.size == arr.size - 1
  #     rotated_arr.push(element)
  #   else
  #     rotated_arr.prepend(element)
  #   end
  # end
  # rotated_arr
end

def rotate_string(str)
  rotate_array(str.chars).join
end

def rotate_integer(num)
  rotate_string(num.to_s).to_i
end

p rotate_string('hello world') == 'ello worldh'
p rotate_integer(123456) == 234561

# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true