count = 1

loop do
  e_or_o = count.even? ? 'even' : 'odd'
  puts "#{count} is #{e_or_o}!"
  break if count >= 5
  count += 1
end