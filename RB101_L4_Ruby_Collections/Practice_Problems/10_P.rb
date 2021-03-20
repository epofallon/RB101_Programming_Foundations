munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, info_hash|
  age = info_hash["age"]
  age_range = if (0..17).include?(age)
                'kid'
              elsif (18..64).include?(age)
                'adult'
              elsif age >= 65
                'senior'
              end
  info_hash["age_group"] = age_range
end

munsters.each{ |name, info_hash| puts "#{name} => #{info_hash}" }