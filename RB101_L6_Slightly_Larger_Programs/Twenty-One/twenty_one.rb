require 'pry'
SUIT_ARR = [{'2'=> 2}, {'3'=> 3}, {'4'=> 4}, {'5'=> 5}, {'6'=> 6}, {'7'=> 7},
            {'8'=> 8}, {'9'=> 9}, {'10'=> 10}, {'jack'=> 10}, {'queen'=> 10},
            {'king'=> 10}, {'ace'=> 11}]

def prompt(msg)
  puts "=> #{msg}"
end

def valid_response?(answer, check_arr)
  check_arr.include? answer
end

def initialize_deck
  deck_arr = []
  4.times do
    deck_arr << SUIT_ARR
  end
  deck_arr.flatten.shuffle
end

def deal_card(deck, hands, player)
  card = deck.shift
  hands[player] << {card.keys[0] => card.values[0]}
end
  
def first_deal (deck, hands)
  2.times do
    deal_card(deck, hands, :player)
    deal_card(deck, hands, :dealer)
  end
end

def sum_both_hands(hands, totals)
  [:player, :dealer].each { |player| sum_hand(hands, player, totals) }
end

def sum_hand(hands, player, totals)
  sum = 0
  hands[player].each do |card|
    sum += card.values[0]
  end
  totals[player] = sum
end

def any_aces?(hands, player)
  hands[player].any? { |card| card.key?('ace') }
end

def pull_aces(hands, player)
  hands[player].select { |card| card.key?('ace') }
end

def assign_aces(hands, player, totals)
  aces = pull_aces(hands, player)
  count = 0
  loop do
    break if (totals[player] <= 21) || (count == aces.length)
    aces[count]['ace'] = 1
    sum_hand(hands, player, totals)
    count += 1
  end
end

def hit_or_stay
  answer = ''
  loop do
    prompt "Would you like to (h)it or (s)tay?"
    answer = gets.chomp.downcase.delete(' ')
    break if valid_response?(answer, %w(h s))
    prompt "That's not a valid choice."
  end
  answer
end

def player_turn(deck, hands, totals, current_player)
  loop do
    
    
    puts "hit or stay"
    answer = gets.chomp
    if answer == 'hit'
      deal_card(deck, hands, current_player)
    end
    sum_hand(hands, current_player, totals)
    assign_aces(hands, current_player, totals) unless pull_aces(hands, current_player).empty?
    break if answer == 'stay' || busted?(totals, current_player)
  end
  
  if busted?(totals, current_player)
    display_winner(totals)
    play_again? ? 'next' : 'break'
  else
    prompt "you stayed at #{totals[current_player]}"
  end
end

def dealer_turn(deck, hands, totals, current_player)
  current_player = :dealer
  loop do
    sum_hand(hands, current_player, totals)
    assign_aces(hands, current_player, totals) unless pull_aces(hands, current_player).empty?
    break if totals[current_player] >= 17
    deal_card(deck, hands, current_player)
  end
end

def busted?(totals, player)
  totals[player] > 21
end

def winner(totals)
  if busted?(totals, :player)
    :player_busted
  elsif busted?(totals, :dealer)
    :dealer_busted 
  elsif totals[:player] > totals[:dealer]
    :player
  elsif totals[:dealer] > totals[:player]
    :dealer
  else
    :tie
  end
end

def display_winner(totals)
  result = winner(totals)
  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def play_again?
  answer = ''
  loop do
    prompt 'Do you want to play again? (y or n)'
    answer = gets.chomp.downcase.delete(' ')
    break if valid_response?(answer, %w(y n))
    prompt "That's not a valid choice."
  end
  answer == 'y'
end

loop do
  hands =  { player: [], dealer: [] }
  totals = { player: 0, dealer: 0 }
  deck = initialize_deck
  current_player = :player
  
  first_deal(deck, hands)
  sum_both_hands(hands, totals)
  
  puts "the dealer has #{hands[:dealer][0]} and ???"
  puts "your cards are #{hands[current_player]} with a total of: #{totals[:player]}"

  #player_turn(deck, hands, totals, current_player)
  loop do
    player_choice = hit_or_stay

    if player_choice == 'h'
      deal_card(deck, hands, current_player)
      prompt "You chose to hit!"
      prompt "Your cards are now: #{hands[current_player]}"
      sum_hand(hands, current_player, totals)
      assign_aces(hands, current_player, totals) unless pull_aces(hands, current_player).empty?
      prompt "Your total is now: #{totals[current_player]}"
    end
    
    break if player_choice == 's' || busted?(totals, current_player)
  end
  
  if busted?(totals, current_player)
    display_winner(totals)
    play_again? ? 'next' : 'break'
  else
    prompt "you stayed at #{totals[current_player]}"
  end
  
  current_player = :dealer
  
  dealer_turn(deck, hands, totals, current_player) unless busted?(totals, :player)
  
  
  puts "Your score was #{totals[:player]} with cards #{hands[:player]}"
  puts "Comp score was #{totals[:dealer]} with cards #{hands[:dealer]}"
  
  display_winner(totals)
  break unless play_again?
end
