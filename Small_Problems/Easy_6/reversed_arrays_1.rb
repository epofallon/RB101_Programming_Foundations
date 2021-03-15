# PROBLEM
#   Write a method that takes an Arrayy as an argument, and reverses its elements
#   in place; that is, mutate the Array passed into this method.
#   The return value should be the same Array object.
#   You may not use Array#reverse or Array#reverse!

# input: an array
# output: the same array, mutated to be reversed
# rules:
#   explicit rules:
#   - you may not use .reverse or .reverse! (we want to recreate the functionality of .reverse!)
#   - the returned object is the original object, modified
#   implicit rules:
#   - elements can be any objects

# DATA STRUCTURE
#   Array

# ALGORITHM
# - define methode reverse! that takes an array as an argument.
#   - record the arrays length into arr_length
#   - begin a loop to loop through the array
#   - remove the final element and record in element varaible
#   - attatch element to front of array
#   - subtract one from arr_length
#   - break the loop when arr_length equals 0
# - return the original array

def reverse!(arr)
  iterator = arr.length
  loop do
    element = arr.pop
    arr.prepend(element)
    iterator -= 1
    puts arr.inspect
    break if iterator <= 0
  end
  #puts arr.inspect
end

# TEST CASES / EXAMPLES
list = [1,2,3,4]
result = reverse!(list)
puts result == [4, 3, 2, 1] # true
puts list == [4, 3, 2, 1] # true
puts list.object_id == result.object_id # true

list = %w(a b e d c)
puts reverse!(list) == ["c", "d", "e", "b", "a"] # true
puts list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
puts reverse!(list) == ["abc"] # true
puts list == ["abc"] # true

list = []
puts reverse!(list) == [] # true
puts list == [] # true