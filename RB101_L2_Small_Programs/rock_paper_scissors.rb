require 'yaml'
PROMPTS = YAML.load_file('rps_messages.yml')

VALID_CHOICES = { r: 'rock', p: 'paper', c: 'scissors', l: 'lizard', s: 'spock' }
WHO_BEATS_WHO = { rock: ['lizard', 'scissors'], paper: ['rock', 'spock'], scissors: ['paper', 'lizard'], lizard: ['spock', 'paper'], spock: ['scissors', 'rock'] }
GOAL_WINS = 5
def messages(string)
  PROMPTS[string]
end

def prompt(message)
  Kernel.puts("=> #{PROMPTS[message]}")
end

def get_choice
  choice = ''
  loop do
    prompt 'choose'
    VALID_CHOICES.each { |k, v| Kernel.puts("    #{k} -> #{v}") }
    choice = Kernel.gets().chomp().to_sym()
    break if valid_choice?(choice)
    prompt 'invalid_choice'
  end
  VALID_CHOICES[choice]
end

def valid_choice?(choice)
  VALID_CHOICES.include?(choice)
end

def win?(first, second)
  WHO_BEATS_WHO[first.to_sym].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt 'you_won_round'
  elsif win?(computer, player)
    prompt 'comp_won_round'
  else
    prompt 'tie_round'
  end
end

def update_score(choice1, choice2)
  win?(choice1, choice2) ? 1 : 0
end

def goal_reached?(player, computer)
  player == GOAL_WINS || computer == GOAL_WINS
end

def display_winner(player, computer)
  prompt player == GOAL_WINS ? 'you_won_game' : 'comp_won_game'
end

prompt 'welcome'
prompt 'goal'

player_score = 0
computer_score = 0
loop do
  choice = get_choice
  comp_choice = VALID_CHOICES.values.sample

  prompt "You chose: #{choice}; Computer chose: #{comp_choice}"

  display_results(choice, comp_choice)
  player_score += update_score(choice, comp_choice)
  computer_score += update_score(comp_choice, choice)
  
  prompt "Your score: #{player_score}; Computer score: #{computer_score}"
  
  break if goal_reached?(player_score,computer_score)
end

display_winner(player_score,computer_score)

prompt 'good_bye'
