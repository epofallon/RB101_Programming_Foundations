require 'pry'
require 'yaml'

PROMPTS = YAML.load_file('ttt_messages.yml')
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
CENTER_SQR = 5
COUNT_TO_WIN = 3
AT_RISK_COUNT = COUNT_TO_WIN - 1
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

def valid_response?(answer, check_arr)
  check_arr.include? answer
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
end

def who_goes_first
  answer = ''
  loop do
    prompt 'go_first'
    answer = gets.chomp.downcase
    break if valid_response?(answer, %w(p c r))
    prompt 'invalid_choice'
  end
  
  rand_choice = %w(p c).sample if answer == 'r'
  display_choice(answer, rand_choice)
  sleep(2)
  answer == 'r' ? rand_choice : answer
end

def display_choice(answer, rand_choice)
  case answer
  when 'p' then prompt 'you_chose_p'
  when 'c' then prompt 'you_chose_c'
  when 'r'
    goes_first = rand_choice == 'p' ? 'Player' : 'Computer'
    prompt "The Computer chose '#{goes_first}' to go first."
  end
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  clear
  display_game_info
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

def display_game_info
  prompt "Player: '#{PLAYER_MARKER}'"
  prompt "Computer: '#{COMPUTER_MARKER}'"
end

def initialize_board
  (1..9).each_with_object({}) { |num, brd| brd[num] = INITIAL_MARKER }
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
  square = nil
  marker = offense?(brd) ? COMPUTER_MARKER : PLAYER_MARKER

  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, marker)
    break if square
  end

  square ||= brd[CENTER_SQR] == ' ' ? CENTER_SQR : empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def offense?(brd)
  WINNING_LINES.any? do |line|
    find_at_risk_square(line, brd, COMPUTER_MARKER)
  end
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == AT_RISK_COUNT
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def place_piece!(brd, player)
  player == 'p' ? player_places_piece!(brd) : computer_places_piece!(brd)
end

def alternate_player(current_player)
  current_player == 'p' ? 'c' : 'p'
end

def play_rounds(brd, goes_first)
  current_player = goes_first
  loop do
    display_board(brd)
    place_piece!(brd, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(brd) || board_full?(brd)
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == COUNT_TO_WIN
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == COUNT_TO_WIN
      return 'Computer'
    end
  end
  nil
end

def update_score(winner, scores)
  scores[winner] += 1
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
    answer = gets.chomp.downcase
    break if valid_response?(answer, %w(y n))
    prompt 'invalid_choice'
  end
  answer == 'y'
end

def reset_scores(scores)
  scores.transform_values! { 0 }
end

welcome
goes_first = who_goes_first
scores = { 'Player' => 0, 'Computer' => 0 }

loop do
  board = initialize_board
  play_rounds(board, goes_first)
  display_board(board)

  if someone_won?(board)
    winner = detect_winner(board)
    prompt "#{winner} won!"
    update_score(winner, scores)
  else
    prompt 'tie_round'
  end
  
  display_score(scores)
  next unless goal_reached?(scores)
  champ = grand_winner(scores)
  display_winner(champ)
  break unless play_again?
  goes_first = who_goes_first
  reset_scores(scores)
end

prompt 'good_bye'
