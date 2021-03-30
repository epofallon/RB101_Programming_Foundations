# without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.
result_arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |element|
  incremented_hsh = {}
  element.map do |key, num|
    incremented_hsh[key] = num + 1
  end
  incremented_hsh
end


p result_arr  