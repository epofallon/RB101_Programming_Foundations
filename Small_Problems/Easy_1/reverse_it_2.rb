def reverse_words(string)
  array = string.split
  array.each{ |word| word.reverse! if word.length >= 5 }
  array.join(' ')
end



puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS