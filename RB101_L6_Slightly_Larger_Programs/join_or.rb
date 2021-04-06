# UNDERSTAND THE PROBLEM
=begin
  - Input:
    - takes three arguments
      - 1st argument is an array
      - 2nd argument is what to join between elements
        - this argument has a default of ', '
      - 3rd argument is what to join the last element
        - this argument has a default of 'or'
  - Output:
    - A string
      - string will consist of the array elements separated by the 2nd argument,
        with the addition of the 3rd argument for the final element
=end

# EXAMPLES / TEST CASES
=begin
  joinor([1, 2])                   # => "1 or 2"
    - when two elements the string will default to the thrid element
    - "element_0 space 'or' space element_1"
  joinor([1, 2, 3])                # => "1, 2, or 3"
    - element_0 {comma space} element_1 {comma space} 'or' space element_3
  joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
  joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
  
  - for array length 0 => ""
  - for array length 1 => "1"
  - for array length 2 => "1, 2"
  - for array length 3 => "1, 2, or 3"
=end

# DATA STRUCTURE
=begin
  - input: array
  - deal with data in an array
  - output: string
=end

# ALGORITHM
=begin
  - 
=end
def joinor(arr, delimiter=', ', last_word='or')
  