def sum(num)
  num.to_s.split('').map{ |num| num.to_i }.sum

end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45