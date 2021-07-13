=begin
  Write a method to find the longest common prefix string amongst an array of strings
  If there is no common prefix, return an empty string ""
  
  Input: %w(flower flow flight)
  Output: "fl"
  
  Input: %w(dog racecar car)
  Output: "" --> no common prefix among the input strings
  
  - test cases
p common_prefix(["flower", "flow", "flight"]) == "fl"
p common_prefix(["dog", "racecar", "car"]) == ""
p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
p common_prefix(["throne", "dungeon"]) == ""
p common_prefix(["throne", "throne"]) == "throne"

# input - array of strings
# output - string

# data - arrays, strings

# algorithm
  # iterate from 0 to the length of the smallest string in the array
  #   Using the idx, check if the characters of each string in the array is the same
  #   If it is the same, add the charachter to a results array
  #   If not, return the result array

=end

def common_prefix(array)
  result = []
  max_index = array.min_by { |string| string.size }.size
  (0...max_index).each do |index|
    current_char = array[0][index]
    if array.all? { |str| str[index] == current_char }
      result << current_char 
    else
      break
    end
  end
  result.join('')
end

p common_prefix(["flower", "flow", "fliwht"]) == "fl"
p common_prefix(["dog", "racecar", "car"]) == ""
p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
p common_prefix(["throne", "dungeon"]) == ""
p common_prefix(["throne", "throne"]) == "throne"