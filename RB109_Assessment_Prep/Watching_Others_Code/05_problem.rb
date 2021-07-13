=begin
  Write a method to find the longest common prefix string amongst an array of strings
  If there is no common prefix, return an empty string ""
  
  Input: %w(flower flow flight)
  Output: "fl"
  
  Input: %w(dog racecar car)
  Output: "" --> no common prefix among the input strings
  
- input: an array of strings
- output: a string
  - the longest common prefix string amongst the input array
- explicit requirements:
  - all strings are lowercase letters only
  - return an empty string when there is no common prefix among the input strings
- implicit requirements:
  - the whole word can be the prefix
  
- test cases
p common_prefix(["flower", "flow", "flight"]) == "fl"
p common_prefix(["dog", "racecar", "car"]) == ""
p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
p common_prefix(["throne", "dungeon"]) == ""
p common_prefix(["throne", "throne"]) == "throne"

- data structure --> a string for the return, an array to iterate out of

- algorithm
  - intitialize prefix to ''
  - initialize str_size to 1
  - intiialize str to the first element of the input array
  - loop
    - break when all strings no longer contain the str[0, sub_size]
    - reassign prefix to the str[0, sub_size]
    - increment str_size by 1
  - return prefix
=end

def common_prefix(arr)
  prefix = ''

  str = arr.shift
  
  (1..str.size).each do |str_size|
    break unless arr.all? { |string| string[0, str_size] == str[0, str_size] }
    prefix = str[0, str_size]
    prefix
    str_size += 1
  end
  
  prefix
end

p common_prefix(["flower", "flow", "flight"]) == "fl"
p common_prefix(["dog", "racecar", "car"]) == ""
p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
p common_prefix(["throne", "dungeon"]) == ""
p common_prefix(["throne", "throne"]) == "throne"