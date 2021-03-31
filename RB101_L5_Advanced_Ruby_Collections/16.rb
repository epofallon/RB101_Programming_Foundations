# UNDERSTAND THE PROBLEM
=begin
  Write a method that retuns one UUID when called with no parameters.
  
  A UUID consists of 32 hexidecial characters
  Is typically broken into 5 sections: 8-4-4-4-12
  Is a string
  Looks like: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"
=end

HEX_ARR = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
def make_uuid
  uuid = ''
  36.times do |i|
    if [9, 14, 19, 24].include? i
      uuid << '-'
    else
      uuid << HEX_ARR.sample
    end
  end
  uuid
end

puts make_uuid
