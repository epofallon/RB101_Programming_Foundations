require 'yaml'
PROMPTS = YAML.load_file('rps_messages.yml')

VALID_CHOICES = { r: 'rock',
                  p: 'paper',
                  sc: 'scissors',
                  l: 'lizard',
                  sp: 'spock' }

WHO_BEATS_WHO = { rock: ['lizard', 'scissors'],
                  paper: ['rock', 'spock'],
                  scissors: ['paper', 'lizard'],
                  lizard: ['spock', 'paper'],
                  spock: ['scissors', 'rock'] }

GOAL_WINS = 5

def messages(string)
  PROMPTS[string]
end

def prompt(message)
  Kernel.puts("=> #{messages(message)}")
end

def clear
  system("clear") || system("cls")
end

def welcome
  clear
  prompt 'welcome'
  sleep(0.5)
  prompt 'goal'
  sleep(0.5)
  display_rules
  clear
end

def display_rules
  answer = ''
  loop do
    prompt 'display_rules?'
    answer = Kernel.gets().chomp().downcase
    break if valid_response?(answer)
    prompt 'invalid_choice'
  end

  if answer == 'y'
    prompt 'spacer'
    WHO_BEATS_WHO.each { |k, v| puts "   ~ #{k} beats #{v[0]} & #{v[1]}" }
    prompt 'spacer'
    prompt 'any_key'
    Kernel.gets().chomp()
  end
end

def valid_response?(answer)
  %w(y n).include? answer
end

def get_choice(choices)
  choice = ''
  loop do
    prompt 'spacer'
    prompt 'choose'
    VALID_CHOICES.each { |k, v| Kernel.puts("    #{k} -> #{v}") }
    choice = Kernel.gets().chomp().downcase().to_sym()
    break if valid_choice?(choice)
    prompt 'invalid_choice'
  end
  choices[:player] = VALID_CHOICES[choice]
  clear
end

def valid_choice?(choice)
  VALID_CHOICES.include?(choice)
end

def get_comp_choice(choices)
  choices[:computer] = VALID_CHOICES.values.sample
end

def win?(choices)
  if WHO_BEATS_WHO[choices[:player].to_sym].include?(choices[:computer])
    :player
  elsif WHO_BEATS_WHO[choices[:computer].to_sym].include?(choices[:player])
    :computer
  end
end

def display_choices(choices)
  prompt 'spacer'
  puts "=> #{messages('you_chose')} #{choices[:player]}"
  puts "=> #{messages('comp_chose')} #{choices[:computer]}"
  prompt 'spacer'
  sleep(0.75)
end

def display_result(winner)
  case winner
  when :player   then prompt 'you_won_round'
  when :computer then prompt 'comp_won_round'
  else                prompt 'tie_round'
  end
  prompt 'spacer'
end

def update_score(winner, scores)
  scores[winner] += 1 unless scores[winner].nil?
end

def display_score(scores)
  puts "=> #{messages('your_score')} #{scores[:player]}"
  puts "=> #{messages('comp_score')} #{scores[:computer]}"
  sleep(2.5)
  clear
end

def goal_reached?(scores)
  scores.value?(GOAL_WINS)
end

def grand_winner(scores)
  scores[:player] == GOAL_WINS ? :player : :winner
end

def display_winner(champ)
  prompt 'spacer'
  prompt champ == :player ? 'you_won_game' : 'comp_won_game'
  prompt 'spacer'
  sleep(0.75)
end

def play_again?
  answer = ''
  loop do
    prompt 'play_again?'
    answer = Kernel.gets().chomp().downcase
    break if valid_response?(answer)
    prompt 'invalid_choice'
  end
  answer == 'y'
end

def reset_scores(scores)
  scores.transform_values! { 0 }
end

welcome
scores = { player: 0, computer: 0 }
choices = { player: '', computer: '' }
loop do
  get_choice(choices)
  get_comp_choice(choices)
  display_choices(choices)
  winner = win?(choices)
  display_result(winner)
  update_score(winner, scores)
  display_score(scores)
  next unless goal_reached?(scores)
  champ = grand_winner(scores)
  display_winner(champ)
  break unless play_again?
  reset_scores(scores)
  clear
end

prompt 'good_bye'
