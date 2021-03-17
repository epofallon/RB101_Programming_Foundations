numbers = []
i = 0
(1..99).each {|i| numbers << i}
while i < 5
  puts numbers.sample
  i += 1
end