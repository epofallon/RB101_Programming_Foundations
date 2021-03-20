# Create a hash that expresses the frequency with which each letter occurs in this string

statement = "The Flintstones Rock"
statement = statement.tr_s(' ', '')
chars_hash = statement.chars.each_with_object({}) do |char, hash|
               hash[char] = statement.count char
             end

p chars_hash

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

p result

p result == chars_hash