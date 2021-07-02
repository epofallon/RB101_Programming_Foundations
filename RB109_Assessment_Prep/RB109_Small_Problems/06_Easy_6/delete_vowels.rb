=begin
- input: an array of strings
  - 
- output: an array of strings with all values removed
  - 
- explicit requirements: 
  - 
- questions: 
  - 
- implicit requirements:
  - both upper and lowercase vowels removed

===== Test Cases =====
remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
======================

- data structure:
  - an array
  
- algortihm:
  1. iterate through the array
    2. delete vowels
    
  
=end

def remove_vowels(array)
  array.map { |string| string.delete "aeiouAEIOU" }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']