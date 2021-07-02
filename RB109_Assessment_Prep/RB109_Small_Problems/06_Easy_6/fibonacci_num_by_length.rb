=begin
- input: an integer
  - represents the number of digits in the fibonacci number 
- output: an integer
  - represents the index where a fibonacci number with the input integer number of digits first occurs
- explicit requirements: 
  - fibonacci sequence starts with 1 not 0
  - argument is always greater than or equal to 2
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====

======================

- data structure:
  - integers
  
  f(n) = f(n-1) + f(n-2)
  1 + 1 -> 2
  1 + 2 -> 3
  1 -> 2
  
  2 +
- algortihm:
  1. initialize first_previous_num to 1
  2. initialize second_previous_num to 1
  3. initialize current_index to 3
  4. begin a loop
    5. current_num = first_previous_num + second_previous_num
    6. break when current_num length is equal to input integer
    7. increment current_index by 1
    8. second_previous_num = first_previous_num
    9. first_previous_num = current_num
    
=end




def find_fibonacci_index_by_length(num_of_digits)
  first = 1
  second = 1
  index = 3
  loop do
    current = first + second
    break if current.to_s.size >= num_of_digits
    index += 1
    second = first
    first = current
  end
  index
end

p find_fibonacci_index_by_length(2) #== 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) #== 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) #== 45
p find_fibonacci_index_by_length(100) #== 476
p find_fibonacci_index_by_length(1000) #== 4782
p find_fibonacci_index_by_length(10000) #== 47847