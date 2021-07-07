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
[8]703529146 - rotate 8           [-10]
7[0]35291468 - lock 7, rotate 0   [-9]
73[5]2914680 - lock 3, rotate 5   [-8]
732[9]146805 - lock 2, rotate 9   [-7]
7321[4]68059 - lock 1, rotate 4   [4]
73216[8]0594 - lock 6, rotate 8   [5]
732160[5]948 - lock 0, rotate 5   [6]
7321609[4]85 - lock 9, rotate 4   [7]
73216098[5]4 - lock 8, rotate 5   [8]
732160984[5] - lock 4, 5 is the only number left
===== Test Cases =====
max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845
======================
index start of slice goes from -length to -2
- data structure:
  - 
  
- algortihm:
  1. initialize index at - length of integer
  2. begin a loop
    3. pass in the number and
    4. break when the index is greater than or equal to -2 
    5. increment index by one
=end

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_rightmost_digits(num, r_digits)
  digits = num.to_s.chars
  digits[-r_digits..-1] = rotate_array(digits[-r_digits..-1])
  digits.join.to_i
end

def max_rotation(num)
  start_idx = num.to_s.size
  loop do
    break if start_idx < 2
    num = rotate_rightmost_digits(num, start_idx)
    start_idx -= 1
  end
  num
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15
p max_rotation(8_703_529_146) == 7_321_609_845