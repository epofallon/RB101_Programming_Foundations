arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr2 = arr.map do |sub_arr|
    sub_arr.sort {|a, b| b <=> a }
end

p arr2