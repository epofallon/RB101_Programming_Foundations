VALID_CHOICES = { r: 'rock',
                  p: 'paper',
                  c: 'scissors',
                  l: 'lizard',
                  s: 'spock' }

WHO_BEATS_WHO = { rock: ['lizard', 'scissors'],
                  paper: ['rock', 'spock'],
                  scissors: ['paper', 'lizard'],
                  lizard: ['spock', 'paper'],
                  spock: ['scissors', 'rock'] }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_choices
  VALID_CHOICES.each { |k, v| Kernel.puts("    #{k} -> #{v}") }
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

prompt("Welcome to Rock, Paper, Scissor, Lizard, Spock!")
prompt("First to 5 points wins the game!")

player_score = 0
computer_score = 0
loop do
  choice = ''
  loop do
    prompt("Choose one:")
    display_choices
    choice = Kernel.gets().chomp().to_sym()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  comp_choice = VALID_CHOICES.values.sample

  prompt("You chose: #{VALID_CHOICES[choice]}; Computer chose: #{comp_choice}")

  display_results(VALID_CHOICES[choice], comp_choice)

  if win?(VALID_CHOICES[choice], comp_choice)
    player_score += 1
  elsif win?(comp_choice, VALID_CHOICES[choice])
    computer_score += 1
  end

  prompt("Your score: #{player_score}; Computer score: #{computer_score}")

  # prompt("Do you want to play again?")
  # answer = Kernel.gets().chomp()
  if player_score == 5
    prompt("You've won! Congratulations!")
    break
  elsif computer_score == 5
    prompt("The computer won. Better luck next time!")
    break
  end
end

prompt("Thank you for playing. Good bye!")
