=begin
- algorithm
  - max number = sort the digits, fid the max num
  - current number ... max number, break if number contains all the digits
  - 514 include? 5, 1, 3 return that number ... if no number is found, then return -1
=end

def next_bigger_num(num)
  
end

p next_bigger_num(12) == 21
p next_bigger_num(2017) == 2071
p next_bigger_num(513) == 531
p next_bigger_num(9) == -1
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798