=begin
- input: a string
  - 
- output: a new string with the case of every letter swapped
  - 
- explicit requirements: 
  - cannot use String#swapcase
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
======================

- data structure:
  - an array of charchters
  
- algortihm:
  1. split the input string into an array of characters
  2. iterate through the array
    3. if the charachter.lowercase is equal to the charachter
      4. uppercase the charachter
    5. if the charachter is equal to its uppercase version
      6. lowercase the charachter
    7. else return the charachter
    
  
=end

def swapcase(string)
  string.chars.map do |char|
    case
    when ('a'..'z').include?(char) then char.upcase
    when ('A'..'Z').include?(char) then char.downcase
    else char
    end
  end.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'