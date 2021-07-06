=begin
- input: a string
  - 
- output: a new string with only constonants doubled
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

def double_consonants(str)
  str.chars.map do |char|
    %w(b c d f g h j k l m n p q r s t v w x y z).include?(char.downcase) ? char * 2 : char
  end.join
end
p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""