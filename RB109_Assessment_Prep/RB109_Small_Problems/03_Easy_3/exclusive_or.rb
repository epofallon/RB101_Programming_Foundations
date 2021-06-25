=begin
- input:
  - two inputs: can be any objects since all ruby objects are either truthy or falsey
- output:
    [true,  true]  --> false
    [false, true]  --> true
    [true,  false] --> true
    [false, false] --> false
- explicit requirements:
  - function returns a boolean value `true` or `false`.
  - function accepts any objects that are truthy or falsey
  - 
- implicit requirements:
  -

===== Test Cases =====
  xor?(5.even?, 4.even?) == true
    [false, true]  --> true
    
  xor?(5.odd?,  4.odd?)  == true
    [true,  false] --> true
    
  xor?(5.odd?,  4.even?) == false
    [true,  true]  --> false
    
  xor?(5.even?, 4.odd?)  == false
    [false, false] --> false
    
======================
- if an `AND` returns `true`, we return `false`
- if an `OR` returns `false`, we return `false`
- if an `AND` returns `false`, & an `OR` returns `true`, we return `true`
  - !AND && OR
- data structure:
  - no need for arrays or data structures. will be dealing with truthiness of given objects and booleans
  
- algortihm:
  1. AND( !AND(arg1, arg2), OR(arg1, arg2) )
  
=end

def xor?(arg1, arg2)
  (arg1 || arg2) && !(arg1 && arg2) 
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false