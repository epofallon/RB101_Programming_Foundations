=begin
- input: a string
  - 
- output: a hash with 3 entries
  - % of lowercase characters
  - % of uppercase characters
  - % of neither case characters
- explicit requirements: 
  - string will always contain at least one character
- questions: 
  - 
- implicit requirements:
  - percentages are floats
  - percentages rounged to one decimal place

===== Test Cases =====
letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
======================

- data structure:
  - a hash
  
  
- algortihm:
  2. count the total number of characters in the string as a float
  3. divide the count of lowercase characters by the total number of characters
    4. multiply by 100 and store in an array
=end

def letter_percentages(str)
  percents = {}
  num_chars = str.size.to_f
  
  percents[:lowercase] = ((str.count('a-z') / num_chars) * 100).round(1)
  percents[:uppercase] = ((str.count('A-Z') / num_chars) * 100).round(1)
  percents[:neither] = (100 - percents.values.sum).round(1)
  
  percents
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI  ')