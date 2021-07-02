=begin
- input: a string
  - 
- output: a new string
  - every other charachter is capitalized, and the others are lowercased
- explicit requirements: 
  - non-alphabetic characters still count in the staggering of uppercase / lowercase
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
======================

- data structure:
  - an array of charachters
  
- algortihm:
  1. split the string into an array
  2. map through the string with index
    3. if index is even uppercase the character
    4. else lowercase the charachter
  5. join the array of charachters back into a string
  
=end

def staggered_case(str, up_down='up', include_non_alphas=false)
  up = (up_down == 'up')
  str.chars.each do |char|
    if char =~ /[a-z]/i || !include_non_alphas
      up ? char.upcase! : char.downcase!
      up = !up
    end
  end.join
end

p staggered_case('I Love Launch School!') #== 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'