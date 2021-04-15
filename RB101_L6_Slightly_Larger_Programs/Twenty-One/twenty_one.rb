require 'yaml'
require 'pry'

PROMPTS = YAML.load_file('twenty_one.yml')
SUIT_ARR = [{ '2' => 2 }, { '3' => 3 }, { '4' => 4 }, { '5' => 5 },
            { '6' => 6 }, { '7' => 7 }, { '8' => 8 }, { '9' => 9 },
            { '10' => 10 }, { 'Jack' => 10 }, { 'Queen' => 10 },
            { 'King' => 10 }, { 'Ace' => 11 }]
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

def clear
  system("clear") || system("cls")
end

def empty_line
  puts ''
end

def press_to_continue
  sleep(1)
  prompt 'press_to_continue'
  gets.chomp
end

def welcome
  clear
  prompt 'welcome'
  empty_line
  sleep(1)
  prompt "Get your card total as close to #{GOAL_TOTAL} without going over."
  prompt "First to #{GOAL_WINS} points wins the game!"
  empty_line
  press_to_continue
end

def inititalize_first_hands(deck, hands, totals)
  first_deal(deck, hands)
  sum_both_hands(hands, totals)
  display_first_hands(hands, totals)
end

def play_rounds(scores)
  loop do
    hands, totals = initialize_players
    deck = initialize_deck
    current_player = :player
    inititalize_first_hands(deck, hands, totals)
    player_turn(deck, hands, totals, current_player)

    unless busted?(totals, current_player)
      current_player = :dealer
      dealer_turn(deck, hands, totals, current_player)
    end

    round_result(hands, totals, scores)
    break if goal_reached?(scores)
    press_to_continue
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
  hands[player].select { |card| card.key?('Ace') }
end

def adjust_aces(hands, player, totals)
  pull_aces(hands, player).each do |ace|
    if (totals[player] > GOAL_TOTAL) && (ace['Ace'] == 11)
      ace['Ace'] = 1
      totals[player] -= 10
    end
  end
end

def show_cards(hands, current_player)
  cards = []
  hands[current_player].each do |card|
    cards << card.keys[0]
  end
  cards
end

def display_first_hands(hands, totals)
  clear
  prompt "Dealer has [\"#{show_cards(hands, :dealer)[0]}\", \"??\"]"
  prompt "You have #{show_cards(hands, :player)} totaling: #{totals[:player]}"
end

def hit_or_stay
  answer = ''
  loop do
    empty_line
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
    player_hit(deck, hands, totals, current_player) if player_choice == 'h'
    if player_choice == 's'
      prompt "You stayed at #{totals[current_player]}"
      sleep(2)
    end
    break if player_choice == 's' || busted?(totals, current_player)
  end
end

def player_hit(deck, hands, totals, current_player)
  deal_card(deck, hands, current_player)
  prompt 'player_hit'
  sleep(1)
  sum_hand(hands, current_player, totals)
  prompt "Your cards are now: #{show_cards(hands, current_player)}"
  prompt "Your total is now: #{totals[current_player]}"
  sleep(1.5)
end

def dealer_turn(deck, hands, totals, current_player)
  empty_line
  prompt 'dealer_turn'
  sleep(1)
  loop do
    break if totals[current_player] >= DEALER_MIN
    prompt 'dealer_hit'
    sleep(1)
    deal_card(deck, hands, current_player)
    sum_hand(hands, current_player, totals)
    prompt "Dealer's cards are now: #{show_cards(hands, current_player)}"
    sleep(2)
  end

  unless busted?(totals, current_player)
    prompt "Dealer stayed at #{totals[current_player]}"
    sleep(2)
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
  case result
  when :player_busted, :dealer
    scores[:dealer] += 1
  when :dealer_busted, :player
    scores[:player] += 1
  end
end

def display_score(scores)
  prompt "Your score: #{scores[:player]}"
  prompt "Dealer score: #{scores[:dealer]}"
end

def display_final_hands(hands, totals)
  empty_line
  puts "==================="
  prompt "Dealer has #{show_cards(hands, :dealer)} totaling: #{totals[:dealer]}"
  prompt "You have #{show_cards(hands, :player)} totaling: #{totals[:player]}"
  puts "==================="
  sleep(1)
  empty_line
end

def round_result(hands, totals, scores)
  display_final_hands(hands, totals)
  display_winner(totals)
  sleep(1)
  empty_line
  update_score(totals, scores)
  display_score(scores)
end

def goal_reached?(scores)
  scores.value?(GOAL_WINS)
end

def grand_winner(scores)
  scores[:player] == GOAL_WINS ? :player : :dealer
end

def display_champ(champ)
  clear
  puts "==================="
  prompt champ == :player ? 'you_won_game' : 'deal_won_game'
  puts "==================="
  sleep(0.75)
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
  play_rounds(scores)
  sleep(2)
  champ = grand_winner(scores)
  display_champ(champ)
  break unless play_again?
  reset_scores(scores)
end
prompt 'good_bye'
