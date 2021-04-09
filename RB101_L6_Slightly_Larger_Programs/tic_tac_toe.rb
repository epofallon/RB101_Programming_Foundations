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

  # display_rules
end

def who_goes_first
  answer = ''
  loop do
    prompt 'go_first'
    answer = gets.chomp.downcase
    break if valid_response?(answer, %w(p c r))
    prompt 'invalid_choice'
  end
  if answer == 'r'
    rand_choice = %w(p c).sample
  end
  display_choice(answer, rand_choice)
  sleep(2)
  answer == 'r' ? rand_choice : answer
end

def display_choice(answer, rand_choice)
  case answer
  when 'p'
    prompt "You chose 'Player' to go first."
  when 'c'
    prompt "You chose 'Computer' to go first."
  when 'r'
    goes_first = rand_choice == 'p' ? 'Player' : 'Computer'
    prompt "The Computer chose '#{goes_first}' to go first."
  end
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  clear
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
  square = nil
  marker = offense?(brd) ? COMPUTER_MARKER : PLAYER_MARKER

  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, marker)
    break if square
  end

  square ||= brd[5] == ' ' ? 5 : empty_squares(brd).sample

  brd[square] = COMPUTER_MARKER
end

def play_round(brd, goes_first)
  loop do
    display_board(brd)
    case goes_first
    when 'p'
      player_places_piece!(brd)
      break if someone_won?(brd) || board_full?(brd)
      display_board(brd)
      sleep(0.5)
      computer_places_piece!(brd)
      break if someone_won?(brd) || board_full?(brd)
    when 'c'
      computer_places_piece!(brd)
      break if someone_won?(brd) || board_full?(brd)
      display_board(brd)
      player_places_piece!(brd)
      break if someone_won?(brd) || board_full?(brd)
    end
  end
end

def offense?(brd)
  WINNING_LINES.any? do |line|
    find_at_risk_square(line, brd, COMPUTER_MARKER)
  end
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
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
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def update_score(winner, scores)
  scores[winner] += 1 # unless scores[winner].nil?
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
  play_round(board, goes_first)
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
  reset_scores(scores)
end

prompt 'good_bye'