=begin
- input: an array
  - 
- output: the same array sorted
  - 
- explicit requirements: 
  - array contains at least two elements
  - must use bubble sort to sort the array
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
======================

- data structure:
  - an array
  
- algortihm:
  while swap is ture keep looping
  swap set to true
  1. from 0 upto the second to last index
    2. when object at idx is greater than object at idx + 1
      3. swap
      4. set swap to true
  
=end

def bubble_sort!(arr)
  final_idx = arr.length - 2
  swap = true
  while swap do
    swap = false
    0.upto(final_idx) do |idx|
      if arr[idx] > arr[idx + 1]
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
        swap = true
      end
    end
    final_idx -= 1
  end
end
start = Time.now
array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = (0..1000).to_a.reverse
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
stop = Time.now

p stop - start