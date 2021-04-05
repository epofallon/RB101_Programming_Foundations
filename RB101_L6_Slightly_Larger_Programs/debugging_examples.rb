require 'pry'
require 'pry-byebug'

=begin
Write a method that given an array of integers, returns a new array containing only odd numbers that are less than or equal to 15 or multiples of 3
=end

def fizzbuzz(arr)
  arr.map do |num|
    #binding.pry
    if num % 5 == 0 && num % 3 == 0
      'FizzBuzz'
    elsif num % 5 == 0
      'Buzz'
    elsif num % 3 == 0
      'Fizz'
    else
      num
    end
  end
end

p fizzbuzz([1,3,5,6,7,8,10,3,15,9]) == [1,'Fizz', 'Buzz', 'Fizz', 7, 8, 'Buzz', 'Fizz', 'FizzBuzz', 'Fizz']