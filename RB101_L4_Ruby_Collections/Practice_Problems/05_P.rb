# Find the index of the first name that starts with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
first_instance_index = ''


flintstones.each_with_index { |name, index| first_instance_index = index if name.start_with?('Be') }

p first_instance_index

p flintstones.index { |name| name[0, 2] == "Be" }