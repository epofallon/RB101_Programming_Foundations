HEX_DEC = %w(1 2 3 4 5 6 7 8 9 0 a b c d e f)

def create_uuid
  sections = [8, 4, 4, 4, 12]
  uuid = []
  uuid = sections.map do |num|
           HEX_DEC.sample(num).join
         end
  uuid.join('-')
end

p create_uuid
