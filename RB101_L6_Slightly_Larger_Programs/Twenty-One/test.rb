require 'pry'

SUITS = ["\u2663", "\u2660", "\u2665", "\u2666"]
VALUES = ['Ace', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
GOAL_TOTAL = 21

def initialize_deck
  deck = []
  SUITS.each do |suit|
    VALUES.each do |value|
      deck << {suit: suit, value: value}
    end
  end
  deck.shuffle
end

def initialize_players
  return { player: [], dealer: [] }, { player: 0, dealer: 0 }
end

def deal_card!(deck, hands, player)
  card = deck.shift
  hands[player] << card
end

def first_deal(deck, hands)
  2.times do
    deal_card!(deck, hands, :player)
    deal_card!(deck, hands, :dealer)
  end
end

def total_hand!(hands, player, totals)
  sum = 0
  hands[player].each do |card|
    sum += value_card(card)
  end
  totals[player] = sum
  adjust_for_aces(hands, player, totals) unless count_aces(hands, player) == 0
end

def value_card(card)
  if ('1'..'10').include?(card[:value])
    card[:value].to_i
  elsif ['J', 'K', 'Q'].include?(card[:value])
    10
  elsif card[:value] = 'A'
    11
  end
end

def count_aces(hands, player)
  hands[player].count { |card| card[:value] == 'A' }
end

def adjust_for_aces(hands, player, totals)
  count_aces(hands, player).times do 
    totals[player] -= 10 if totals[player] > GOAL_TOTAL
  end
end

def show_cards(hands, player)
  cards = []
  hands[player].each do |card|
    cards << "#{card[:suit]} #{card[:value]}"
  end
  cards
end

deck = initialize_deck

hands, totals = initialize_players
first_deal(deck, hands)
total_hand!(hands, :player, totals)

p show_cards(hands, :player)

