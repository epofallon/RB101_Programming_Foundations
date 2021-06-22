=begin
- input:
  - a positive integer
  - a boolean
- output: an integer
- explicit requirements:
  - the input integer is a salary
  - the output integer is a bonus
  - the input boolean `true` means the bonus is half the salary, or `0` if `false`

- data structure: integer

- algorithm
  1. if `bool` is passed `true` as an argument
    - calculate bonus as half the salary input
  2. if `bool` is passed `false` as an argument
    - return `0` as the bonus


=end

def calculate_bonus(salary, bool)
  bool ? salary / 2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000