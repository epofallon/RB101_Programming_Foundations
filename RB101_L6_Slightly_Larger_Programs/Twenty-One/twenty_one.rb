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
  hands[player].each do |card|
    totals[player] += card.values[0]
  end
  
end

hands =  { player: [], dealer: []}
totals = { player: 0, dealer: 0 }
deck = initialize_deck

first_deal(deck, hands)

p "Player's hand is #{hands[:player]}"
p "Dealer's hand is #{hands[:dealer]}"

sum_hand(hands, :player, totals)
sum_hand(hands, :dealer, totals)

p totals



