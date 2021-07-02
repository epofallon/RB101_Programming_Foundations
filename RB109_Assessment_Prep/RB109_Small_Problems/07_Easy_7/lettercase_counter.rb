=begin
- input: a string
  - 
- output: a hash
  - number of lowercase letters
  - number of uppercase letters
  - number of neither
- explicit requirements: 
  - 
- questions: 
  - 
- implicit requirements:
  - spaces count as charachters

===== Test Cases =====
letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
======================

- data structure:
  - 
  
- algortihm:
  1. initialize case_counts as an empty hash
  2. set case_counts[:lowercase] = string.count "a-z"
  3. set case_counts[:uppercase] = string.count "A-Z"
  4. set case_counts[:neither] = string.length - case_counts.values.sum
  5. return case_counts
  
=end

def letter_case_count(string)
  case_counts = {}
  case_counts[:lowercase] = string.count "a-z"
  case_counts[:uppercase] = string.count "A-Z"
  case_counts[:neither] = string.length - case_counts.values.sum
  case_counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }