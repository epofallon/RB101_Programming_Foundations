VALID_CHOICES = { r: 'rock', p: 'paper', c: 'scissors', l: 'lizard', s: 'spock' }

WHO_BEATS_WHO = { rock: ['lizard', 'scissors'], paper: ['rock', 'spock'], scissors: ['paper', 'lizard'], lizard: ['spock', 'paper'], spock: ['scissors', 'rock'] }

GOAL_WINS = 5

def prompt(message)
  Kernel.puts("=> #{message}")
end

def get_choice
  choice = ''
  loop do
    prompt("Choose one:")
    VALID_CHOICES.each { |k, v| Kernel.puts("    #{k} -> #{v}") }
    choice = Kernel.gets().chomp().to_sym()
    break if valid_choice?(choice)
    prompt("That's not a valid choice.")
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
    prompt("You won this round!")
  elsif win?(computer, player)
    prompt("Computer won this round!")
  else
    prompt("It's a tie!")
  end
end

def update_score(choice1, choice2)
  win?(choice1, choice2) ? 1 : 0
end

prompt("Welcome to Rock, Paper, Scissor, Lizard, Spock!")
prompt("First to 5 points wins the game!")

player_score = 0
computer_score = 0
loop do
  choice = get_choice
  
  comp_choice = VALID_CHOICES.values.sample

  prompt("You chose: #{choice}; Computer chose: #{comp_choice}")

  display_results(choice, comp_choice)
  player_score += update_score(choice, comp_choice)
  computer_score += update_score(comp_choice, choice)

  prompt("Your score: #{player_score}; Computer score: #{computer_score}")
  
  if player_score == GOAL_WINS
    prompt("You've won! Congratulations!")
    break
  elsif computer_score == GOAL_WINS
    prompt("The computer won. Better luck next time!")
    break
  end
  break if goal_reached?(player_score,computer_score)
end



prompt("Thank you for playing. Good bye!")
