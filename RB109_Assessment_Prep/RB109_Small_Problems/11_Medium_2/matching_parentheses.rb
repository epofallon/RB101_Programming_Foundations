=begin
- input: a string
  - 
- output: boolean
  - true if all parentheses are properly balanced
  - false otherwise
- explicit requirements: 
  - must occur in matching '(' & ')' pairs
  - balanced pairs must come in the '(' ')' order and not ')' '('
- questions: 
  - 
- implicit requirements:
  - 

===== Test Cases =====
balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false
======================

- data structure:
  - string
  
- algortihm:
  1. create a copy of the string with all non-parentheses characters removed
  2. remove a '()' pair
  3. break if the string no longer contains a '()'
  4. return true if the string is empty, false otherwise
  
=end
# initialize an array of character sets that need balanced
  # () [] {} "" ''
# initialize an outer loop with all?
def balanced?(string)
  pairs = %w(() [] {} '' "")
  
  pairs.all? do |pair|
    needed_chars = string.delete ('^' + pair)
    loop do
      needed_chars = needed_chars.gsub(pair, '')
      break unless needed_chars.include?(pair)
    end
    needed_chars.size == 0
  end
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false