=begin
  - input: an array of strings
  - output: a series of strings
    - strings are formatted as:
      `string` => `number of occurances`
  
  - explicit requirements:
    - the strings in the array are case sensitive
  - implilcit requirements:
    - an integer representing the number of occurances of each string in the array is tied to that string, so it can be printed out. 
    
  vehicles = %w(car car truck car SUV truck motorcycle motorcycle car truck)
  
  count_occurrences(vehicles)
  --> car => 5
      truck => 3
      suv => 2
      motorcycle => 2

  Data Structure:
  - a hash lends itself well since we will have a key (the string) and a value (the integer)
  
  1. Initialize an empty hash with a default value of 0
  2. Loop through the input array
    3. increment the value in the hash with the key as the current string
  4. Loop through the hash
    5. print each key value pair in the format required

=end

def count_occurrences(vehicle_arr)
  vehicle_hsh = Hash.new(0)
  vehicle_arr.each{ |vehicle| vehicle_hsh[vehicle.downcase] += 1 }
  vehicle_hsh.each{ |vehicle, count| puts "#{vehicle} => #{count}" }
end
vehicles = %w(car car truck car SUV truck Car motorcycle suv motorcycle car truck)
count_occurrences(vehicles)