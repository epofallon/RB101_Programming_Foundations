def select_fruit(food_hash)
  food_hash.select { |k, v| v == 'Fruit' }
end

def select_fruit_2(food_hash, f_or_v = 0)
  selection_hash = {0 => 'Fruit', 1 => 'Vegetable'}
  keys = food_hash.keys
  count = 0
  fruits_hash = Hash.new
  selection_choice = selection_hash[f_or_v]
  loop do
    break if count == keys.length
    
    current_food = keys[count]
    if food_hash[current_food] == selection_choice
      fruits_hash[current_food] = selection_choice
    end
    count += 1
    
  end
  fruits_hash
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}
p select_fruit_2(produce, 1) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
p select_fruit_2(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}