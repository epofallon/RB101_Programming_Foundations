def color_valid(color)
  %w(blue green).include? color
end

puts color_valid('green')