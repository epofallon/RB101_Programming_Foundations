require 'pry'
require 'yaml'

PROMPTS = YAML.load_file('ttt_messages.yml')
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals
GOAL_WINS = 5

def messages(string)
  PROMPTS[string]
end

def prompt(msg)
  puts messages(msg) ? "=> #{messages(msg)}" : "=> #{msg}"
end

def valid_response?(answer)
  %w(y n).include? answer
end

def clear
  system("clear") || system("cls")
end

def welcome
  clear
  prompt 'welcome'
  sleep(1)
  prompt 'goal'
  sleep(1)
  #display_rules
  clear
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  prompt "Player: '#{PLAYER_MARKER}'. Computer: '#{COMPUTER_MARKER}'."
  puts ""
  puts "     |     |   "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |   "
  puts "-----+-----+-----"
  puts "     |     |   "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |   "
  puts "-----+-----+-----"
  puts "     |     |   "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |   "
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter=', ', last_word='or')
  case arr.length
  when 0 then ''
  when 1 then arr.last
  when 2 then arr.join(" #{last_word} ")
  else
    arr[-1] = "#{last_word} #{arr.last}"
    arr.join(delimiter)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt 'invalid_number'
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def update_score(winner, scores)
  scores[winner] += 1 #unless scores[winner].nil?
end

def display_score(scores)
  puts "=> #{messages('your_score')} #{scores['Player']}"
  puts "=> #{messages('comp_score')} #{scores['Computer']}"
  sleep(2.5)
  clear
end

def goal_reached?(scores)
  scores.value?(GOAL_WINS)
end

def grand_winner(scores)
  scores['Player'] == GOAL_WINS ? :player : :computer
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
scores = { 'Player'=>0, 'Computer'=>0 }
loop do
  board = initialize_board
  
  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    winner = detect_winner(board)
    prompt "#{winner} won!"
    update_score(winner,scores)
  else
    prompt 'tie_round'
  end
  display_score(scores)
  next unless goal_reached?(scores)
  champ = grand_winner(scores)
  display_winner(champ)
  break unless play_again?
  reset_scores(scores)
end

prompt 'good_bye'
