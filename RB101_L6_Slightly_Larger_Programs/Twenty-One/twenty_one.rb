require 'pry'
SUIT_ARR = [{'2'=> 2}, {'3'=> 3}, {'4'=> 4}, {'5'=> 5}, {'6'=> 6}, {'7'=> 7},
            {'8'=> 8}, {'9'=> 9}, {'10'=> 10}, {'jack'=> 10}, {'queen'=> 10},
            {'king'=> 10}, {'ace'=> 11}]

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
  player = :player
  4.times do
    deal_card(deck, hands, player)
    player = (player == :player) ? :dealer : :player
  end
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
  player_aces = []
  hands[player].each do |card|
    player_aces << card if card.key?('ace')
  end
  player_aces
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

def busted?(totals, player)
  totals[player] > 21
end
  

hands =  { player: [], dealer: []}
totals = { player: 0, dealer: 0 }
deck = initialize_deck
current_player = :player

first_deal(deck, hands)

loop do
  puts "hit or stay"
  answer = gets.chomp
  break if answer == 'stay' || busted?(totals, current_player)
  deal_card(deck, hands, current_player)
  sum_hand(hands, current_player, totals)
  assign_aces(hands, current_player, totals) if any_aces?(hands, current_player)
end

sum_hand(hands, current_player, totals)
assign_aces(hands, current_player, totals) if any_aces?(hands, current_player)

if busted?(totals, current_player)
  puts 'You busted!'
else
  puts 'You chose to stay!'
end






