=begin
- input: an array and a hash
  - array will contain two or more elements when combined with adjoining spaces will produce a person's name
  - hash will contain two keys `:title` and `:occupation` with appropiate values
- output: 
  - 
- explicit requirements: 
  - 
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====

======================

- data structure:
  - 
  
- algortihm:
  1. 
  
=end

def greetings(name_arr, career_hash)
  name = name_arr.join(' ')
  career = career_hash.values.join(' ')
  puts "Hello, #{name}! Nice to have a #{career} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.