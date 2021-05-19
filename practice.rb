UUID_OPTIONS = ('0'..'9').to_a + ('a'..'f').to_a

def uuid_gen
  lengths = [8, 4, 4, 4, 12]
  uuid = []
  
  lengths.each do |length|
    strng = ''
    length.times { strng << UUID_OPTIONS.sample }
    uuid << strng
  end
  
  uuid.join('-')
end

p uuid_gen
p "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"