=begin
  - input: response from the user
  - output: the area of a room
  - explicit requirements:
    - obtain a length and width from the user in meters
    - display the area in m^2 and ft^2
  - implicit requirements:
    - answer is interpolated into a string
    - format the imperial area to two decimal places
    - format the metric area to one decimal place
    
  data structure: integers and strings
  
  algorithm:
  1. ask user for length in meters
  2. initialize `length` to the response converted to an integer
  3. as user for the width in meters
  4. initialize `width` to the responce converted to an integer
  5. multiply the integers that `length` and `width` reference and assign to `metric_are`
  6. multiply `metric_area` by 10.7639 and assign to `impereial_area`
  7. output a string with string interpolation
    A. Format the integer `metric_area` references to display one decimal place
    B. Formate the float `imperial_area` references to display two decimal places
    
  1. ask user for length in feet
  2. initialize `length` to the response converted to an integer
  3. as user for the width in feet
  4. initialize `width` to the responce converted to an integer
  5. multiply the integers that `length` and `width` reference and assign to `ft_are`
  6. multiply `ft_area` by 12 and assign to `in_area`
  6.5 mutltiply 'inch_area' by 2.54 and assign to 'cm_area'
  7. output a string with string interpolation
    A. Format the integer `metric_area` references to display one decimal place
    B. Formate the float `imperial_area` references to display two decimal places
=end

puts 'Enter the length of the room in feet:'
length = gets.chomp.to_i

puts 'Enter the width of the room in feet:'
width = gets.chomp.to_i

ft_area = length * width
in_area = ft_area * 12
cm_area = in_area * 2.54

puts "The area of the room is #{format("%0.2f", ft_area)} square feet (#{format("%0.2f", in_area)} square inches; #{format("%0.2f", cm_area)} square centimeters)."