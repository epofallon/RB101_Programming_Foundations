# Turn this array into a hash where the names are the keys and the values are the positions in the array

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones = flintstones.each_with_object({}) do |string, hash|
  hash[string] = flintstones.index(string)
end

p flintstones