=begin
- input: strings
  - a noun
  - a verb
  - an adjective
  - an adverb
- output: a string
  - Do you <verb> your <adjective> <noun> <adverb>? That's hilarious!
- explicit requirements: 
  - take inputs from the user
  - output a string with substitutions for specific words from the user input
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

=> Do you walk your blue dog quickly? That's hilarious!
======================

- data structure:
  - a hash with keys noun, verb, adjective, adverb, and values as user inputs
  
- algortihm:
  1. initialize a hash with the keys noun: verb: adjective: adverb: with starting values as empty strings
  2. iterate through the hash 
    3. get input from the user for each key
    4. assign each key to value inputted by the user
  5. output a string with substitutions
  
=end

hash = {
  'noun' => '',
  'verb' => '',
  'adjective' => '',
  'adverb' => '',
}

hash.each do |key, _|
  puts "Enter a #{key}:"
  hash[key] = gets.chomp
end

sentence = "Do you verb your adjective noun adverb? That's hilarious!"

hash.keys.each do |key|
  sentence.sub!(key, hash)
end

p sentence