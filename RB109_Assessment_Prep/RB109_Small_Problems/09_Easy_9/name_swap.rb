def swap_name(name)
  name.split.reverse.join(', ')
end

p swap_name('Joe Robert') == "Robert, Joe"