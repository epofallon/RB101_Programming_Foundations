=begin
- input: a year
  - 
- output: a string
  - indicates the century of that year
- explicit requirements:
  - the return string should be the century number, then 'st', 'nd', 'rd', or 'th' year
  - new centuries begin in years that end with `01`.
    --> 1901 - 2000 ==> '20th'
- implicit requirements:
  - `st`  1, 21, 31
  - `nd`  2, 22, 32
  - `rd`  3, 23, 33
  - `th`  4-20, 24-30, 34-40
    4, 5, 6, 7, 8, 9, 0
    11, 12, 13

===== Test Cases =====
  century(2000) == '20th'
  century(2001) == '21st'
  century(1965) == '20th'
  century(256) == '3rd'
  century(5) == '1st'
  century(10103) == '102nd'
  century(1052) == '11th'
  century(1127) == '12th'
  century(11201) == '113th'
======================
1   st
2   nd
3   rd
4   th
5   th
6   th
7   th
8   th
9   th
10  th
11  th
12  th
13  th
14  th
15  th
16  th
17  th
18  th
19  th
20  th
21  st
22  nd
23  rd
24  th
25  th
26  th
27  th
28  th
29  th

- data structure:
  - constants to manage keys --> arrays
  - strings
  
  --> 1901 - 2000 ==> '20th'
  - 
  
- algortihm:
  1. determine the century number
    A. if year % 10  == 0 the century number is year / 100
    B. else year / 100 + 1
  2. determine the appropiate ending
    B. select 'st' if the integer ends with 1, but integer % 100 != 11
    C. select 'nd' if the integer ends with 2, but integer % 100 != 12
    D. select 'rd' if the integer ends with 3, but integer % 100 != 13
  
=end
ST = 1
ND = 2
RD = 3
EXCEPTIONS = [11, 12, 13]

def century(year)
  cent_num = year / 100
  (cent_num += 1 ) if year % 100 != 0
  
  "#{cent_num}#{ending(cent_num)}"
end

def ending(num)
  return 'th' if EXCEPTIONS.include?(num % 100)
  last_digit = num % 10
  
  case last_digit
  when ST then 'st'
  when ND then 'nd'
  when RD then 'rd'
  else 'th'
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'