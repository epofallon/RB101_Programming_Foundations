# Understand the Problem
=begin
  - input: a string argument
  - output: true/false
    - true if all parentheses in the string are properly balanced
    - false otherwise
  - explicit rules:
    - properly balanced parentheses occur in matching '(' ')' pairs
    - a balanced pair can only start with a '(' and not a ')'
=end

# Test Cases / Examples
=begin
  balanced?('What (is) this?') == true
  balanced?('What is) this?') == false
  balanced?('What (is this?') == false
  balanced?('((What) (is this))?') == true
  balanced?('((What)) (is this))?') == false
  balanced?('Hey!') == true
  balanced?(')Hey!(') == false
  balanced?('What ((is))) up(') == false
=end

