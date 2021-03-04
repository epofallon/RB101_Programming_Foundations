def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".") # splits the input string at the '.' into an array of strings.
  return false unless dot_separated_words.size == 4 
  while dot_separated_words.size > 0 do         # loop while the size of the array is greater than 0.
    word = dot_separated_words.pop              # pop the last string in the array into a variable.
    return false unless (0..255).include? word.to_i        # breaks the loop unless is_an_ip_number? returns true.
  end                                           # loop will repeat until dot_separated_words.size == 0 or is_an_ip_number returns false
  true
end


p dot_separated_ip_address?('255.20.72.3')