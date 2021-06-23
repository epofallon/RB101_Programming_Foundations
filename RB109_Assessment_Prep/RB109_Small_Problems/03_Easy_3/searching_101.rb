=begin
- input:
  - six integers from the user
- output: 
  - whether the sixth number appears in the first five numbers or not
- explicit rules:
  - get six numbers from the user
  - 
- implicit rules:
  - change 1st, 2nd, 3rd, 4th, 5th, last out of the prompt
  - store the first 5 numbers in an array
  - don't store the sixth number in the array
  
  ==> Enter the 1st number:
  25
  ==> Enter the 2nd number:
  15
  ==> Enter the 3rd number:
  20
  ==> Enter the 4th number:
  17
  ==> Enter the 5th number:
  23
  ==> Enter the last number:
  17
  The number 17 appears in [25, 15, 20, 17, 23].
  
  The number 18 does not appear in [25, 15, 20, 17, 23].
  
  data structure:
  - an array to hold numbers
  - another array to hold the `nth` number
  
  algorithm:
  1. initialize `nth_nums` as %w(1st 2nd 3rd 4th 5th last)
  2. initialize `nums` as an empty array
  3. initialize `last_num` as nil
  4. iterate through `nth_nums` array object
    A. prompt user for the `nth` number
    B. initialize `input_num` to the input converted to an integer
    C. if `nth` is equal to last
      I. assign `last_num` to `input_num`
    D. else push `input_num` to `nums` array
  5. if `nums` array includes `last_num`
    A. Output "The number #{last_num} appears in #{nums}."
  6. else
    B. Output "The number #{last_num} does not appear in #{nums}."
=end

nth_nums = %w(1st 2nd 3rd 4th 5th last)
nums = []
last_num = nil

nth_nums.each do |nth|
  puts "==> Enter the #{nth} number:"
  input_num = gets.chomp.to_i
  nth == 'last' ? (last_num = input_num) : (nums << input_num)
end

if nums.include?(last_num)
  puts "The number #{last_num} appears in #{nums}."
else
  puts "The number #{last_num} does not appear in #{nums}."
end