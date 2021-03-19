def double_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * 2

    counter += 1
  end

  doubled_numbers
end

def double_numbers!(numbers)
  counter = 0
  
  loop do
   break if counter == numbers.size
   numbers[counter] = numbers[counter] * 2
   counter += 1
  end
  
end

def multiply(numbers, multiplier)
  multiplied_numbers = []
  counter = 0
  
  loop do
    break if counter == numbers.length
    
    current_number = numbers[counter]
    multiplied_numbers << current_number * multiplier
    counter += 1
  end
  multiplied_numbers
end

# p my_numbers = [1, 4, 3, 7, 2, 6]
# p double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]
# p my_numbers
# p double_numbers!(my_numbers)
# p my_numbers

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]