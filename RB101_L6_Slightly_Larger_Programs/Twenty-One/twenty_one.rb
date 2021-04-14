require 'yaml'
require 'pry'

PROMPTS = YAML.load_file('twenty_one.yml')
SUIT_ARR = [{ '2' => 2 }, { '3' => 3 }, { '4' => 4 }, { '5' => 5 },
            { '6' => 6 }, { '7' => 7 }, { '8' => 8 }, { '9' => 9 },
            { '10' => 10 }, { 'jack' => 10 }, { 'queen' => 10 },
            { 'king' => 10 }, { 'ace' => 11 }]
DEALER_MIN = 17
GOAL_TOTAL = 21
GOAL_WINS = 5

def messages(string)
  PROMPTS[string]
end

def prompt(msg)
  puts messages(msg) ? "=> #{messages(msg)}" : "=> #{msg}"
end

def valid_response?(answer, check_arr)
  check_arr.include? answer
end

def welcome
  prompt 'welcome'
  prompt "Get your card total as close to #{GOAL_TOTAL} without going over."
  prompt "First to #{GOAL_WINS} points wins the game!"
end

def play_round(scores)
  loop do # rounds loop
    hands, totals = initialize_players
    deck = initialize_deck
    current_player = :player
    first_deal(deck, hands)
    sum_both_hands(hands, totals)
    display_hands(hands, totals, current_player)
    player_turn(deck, hands, totals, current_player)

    unless busted?(totals, current_player)
      current_player = :dealer
      dealer_turn(deck, hands, totals, current_player)
    end

    round_result(hands, totals, scores)
    break if goal_reached?(scores)
  end
end

def initialize_deck
  deck_arr = []
  4.times do
    deck_arr << SUIT_ARR
  end
  deck_arr.flatten.shuffle
end

def initialize_players
  return { player: [], dealer: [] }, { player: 0, dealer: 0 }
end

def deal_card(deck, hands, player)
  card = deck.shift
  hands[player] << { card.keys[0] => card.values[0] }
end

def first_deal(deck, hands)
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
  adjust_aces(hands, player, totals) unless pull_aces(hands, player).empty?
end

def pull_aces(hands, player)
  hands[player].select { |card| card.key?('ace') }
end

def adjust_aces(hands, player, totals)
  pull_aces(hands, player).each do |ace|
    if totals[player] > GOAL_TOTAL && ace['ace'] == 11
      ace['ace'] = 1
      totals[player] -= 10
    end
  end
end

def display_hands(hands, totals, current_player)
  prompt "the dealer has #{hands[:dealer][0]} and ???"
  prompt "Your cards: #{hands[current_player]} with total: #{totals[:player]}"
end

def hit_or_stay
  answer = ''
  loop do
    prompt 'hit_or_stay'
    answer = gets.chomp.downcase.delete(' ')
    break if valid_response?(answer, %w(h s))
    prompt 'invalid_choice'
  end
  answer
end

def player_turn(deck, hands, totals, current_player)
  loop do
    player_choice = hit_or_stay
    if player_choice == 'h'
      deal_card(deck, hands, current_player)
      prompt 'player_hit'
      sum_hand(hands, current_player, totals)
      prompt "Your cards are now: #{hands[current_player]}"
      prompt "Your total is now: #{totals[current_player]}"
    end
    prompt "you stayed at #{totals[current_player]}" if player_choice == 's'
    break if player_choice == 's' || busted?(totals, current_player)
  end
end

def dealer_turn(deck, hands, totals, current_player)
  prompt 'dealer_turn'
  loop do
    break if totals[current_player] >= DEALER_MIN
    prompt 'dealer_hit'
    sleep(1)
    deal_card(deck, hands, current_player)
    sum_hand(hands, current_player, totals)
    prompt "Dealer's cards are now: #{hands[current_player]}"
  end

  unless busted?(totals, current_player)
    prompt "Dealer stayed at #{totals[current_player]}"
  end
end

def busted?(totals, player)
  totals[player] > GOAL_TOTAL
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
  when :player_busted then prompt 'player_busted'
  when :dealer_busted then prompt 'dealer_busted'
  when :player then prompt 'player_win'
  when :dealer then prompt 'dealer_win'
  when :tie then prompt 'tie'
  end
end

def update_score(totals, scores)
  result = winner(totals)
  # binding.pry
  case result
  when :player_busted, :dealer
    scores[:dealer] += 1
  when :dealer_busted, :player
    scores[:player] += 1
  end
end

def display_score(scores)
  prompt "Your score is #{scores[:player]}"
  prompt "Dealer score is #{scores[:dealer]}"
end

def round_result(hands, totals, scores)
  puts "==================="
  prompt "Dealer total is #{totals[:dealer]} with cards #{hands[:dealer]}"
  prompt "Player total is #{totals[:player]} with cards #{hands[:player]}"
  puts "==================="
  display_winner(totals)
  update_score(totals, scores)
  display_score(scores)
end

def goal_reached?(scores)
  scores.value?(GOAL_WINS)
end

def play_again?
  answer = ''
  loop do
    prompt 'play_again'
    answer = gets.chomp.downcase.delete(' ')
    break if valid_response?(answer, %w(y n))
    prompt 'invalid_choice'
  end
  answer == 'y'
end

def reset_scores(scores)
  scores.transform_values! { 0 }
end

welcome
scores = { player: 0, dealer: 0 }
loop do # match loop
  play_round(scores)
  break unless play_again?
  reset_scores(scores)
end
prompt 'good_bye'
