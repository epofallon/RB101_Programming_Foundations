# UNDERSTAND THE PROBLEM
=begin
  If there's an immediate threat, then the computer should defend the third square.
  An immediate threat is 2 squares marked by the opponent in a row/column/diagonal.
  If there is no immediate threat pick a random square.
  
  - Input: the game board hash
  - Output: modified game board hash
  - Explicit Requirements
    - Computer recognizes when player is a single move away from winning
    - Computer responds by blocking that move
    - If no threat it will play randomly
  - Implicit Requirements
    - 
=end

# EXAMPLES / TEST CASES
=begin
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals

  if computer detects a winning line is 2/3 complete and the third square is empty, play the third square
=end

# DATA STRUCTURE
  # The board hash is what will ultimately be modified
  # arrays of integers to check for winning lines

# ALGORITHM
=begin
  - if a line in WINNING_LINES has two PLAYER_MARKERs and a blank
    - play that blank
  - else
    - play a random square
=end

WINNING_LINES.each do |line|
=begin
    square = nil
    if (brd,values_at(*line).count(PLAYER_MARKER) == 2)
      line.each do |num|
        square = COMPUTER_MARKER if brd[num] == INITIAL_MARKER
      end
      return square
    end
=end
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def computer_places_piece!(brd)
  binding.pry
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
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