letters_and_numbers = {"a" => 1, "b" => 2, "c" => 3}

hsh = letters_and_numbers.select do |letter, num|
  num < 4
end

p hsh