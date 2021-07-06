=begin
- input: two integers
  - a starting number and an ending number
- output: 
  - print out all numbers including and between the two input numbers
  - if a number is divisible by 3 print 'Fizz'
  - if a number is divisible by 5 print 'Buzz'
  - if a number is divisible by both print 'Fizz Buzz'
- explicit requirements: 
  - 
- questions: 
  - 
- implicit requirements:
  - inclusive of the input integers

===== Test Cases =====
fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
======================

- data structure:
  - a range
  
- algortihm:
  1. iterate through the inclusive range
    2. if the current number is divisble by 3 and 5
      3. print 'Fizz Buzz'
    4. if the current number is divisible by 3
      5. print 'Fizz'
    6. if the current number is divisible by 5
      7. print 'Buzz'
    8. else print the current number
  
=end

def fizzbuzz(start_num, end_num)
  (start_num..end_num).each do |num|
    prnt = case
           when div(num, 3) && div(num, 5) then 'FizzBuzz'
           when div(num, 3) then 'Fizz'
           when div(num, 5) then 'Buzz'
           else num
           end
    puts prnt
  end
end

def div(num, div)
  num % div == 0
end


fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz