hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels_arr = []

hsh.each do |_, array|
  array.each do |word|
    word.each_char do |char|
      vowels_arr << char if %w(a e i o u).include?(char)
    end
  end
end

p vowels_arr