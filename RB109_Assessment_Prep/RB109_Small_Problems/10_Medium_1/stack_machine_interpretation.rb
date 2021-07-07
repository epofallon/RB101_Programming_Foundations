=begin
- input: a string with commands seperated by spaces
  - 
- output: 
  - 
- explicit requirements: 
  - implement a miniature stack-and-register-based programming language
    - `n`     Where the register value will be stored
    - `PUSH`  Push the register value onto the stack (leaves register value in register)
    - `ADD`   Pops a value from the stack, adds it to the register value (store result in register)
    - `SUB`   Pops a value from the stack, subtracts it from the register value (store result in register)
    - `MULT`  Pops a value from the stack, multiplies it by the register value (store result in register)
    - `DIV`   Pops a value from the stack, divides it into the register value (store the integer result in register)
    - `MOD`   Pops a value from the stack, divides it into the register value (store the integer remainder in register)
    - `POP`   Remove the topmost item from the stack and place it in the register
    - `PRINT` Print the register value
  - initialize the register to 0
- questions: 
  - 
- implicit requirements:
  - 


- data structure:
  - 
  
- algortihm:
  minilang
    1. initialize the register to 0 and the stack to an empty array
    2. split the input by space
    3. iterate through the input commands
      4. perform the specific command
  n
  
  PUSH
  
  ADD
  
  SUB
  
  MULT
  
  DIV
  
  MOD
  
  POP
  
  PRINT
  
=end

def minilang(commands)
  rgstr = 0
  stack = []
  commands.split(' ').each do |cmmnd|
    case cmmnd.upcase
    when 'PUSH'   then stack << rgstr
    when 'ADD'    then rgstr += stack.pop
    when 'SUB'    then rgstr -= stack.pop
    when 'MULT'   then rgstr *= stack.pop
    when 'DIV'    then rgstr /= stack.pop
    when 'MOD'    then rgstr %= stack.pop
    when 'POP'    then rgstr = stack.pop
    when 'PRINT'  then puts rgstr
    when 'PSTCK'  then p stack
    when int?(cmmnd) then rgstr = cmmnd.to_i
    else return "ERROR! '#{cmmnd}' command not recognized."
    end
  end
  nil
end

def int?(str)
  str.to_i.to_s
end

p minilang('3 PUSH 5 MoD PUSH 7 push 5 PUSH 4 MULT PUSH 3 ADD SUB DIV PRINT PSTCK')
