require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
CPU_MARKER = 'O'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[2, 5, 8], [1, 4, 7], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is a #{CPU_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

# Board structure will look like a hash. Keys represent square, value is X, O,
def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER } # Saves us from typing
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd),)})"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Choice invalid."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  if !!cpu_ai(brd)
    square = cpu_ai(brd)
  else
    if brd[5] == INITIAL_MARKER
      square = 5
    else
      square = empty_squares(brd).sample
    end
  end
  brd[square] = CPU_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    # if brd[line[0]] == PLAYER_MARKER &&
    #   brd[line[1]] == PLAYER_MARKER &&
    #   brd[line[2]] == PLAYER_MARKER
    #  return 'Player'
    # elsif brd[line[0]] == CPU_MARKER &&
    #      brd[line[1]] == CPU_MARKER &&
    #      brd[line[2]] == CPU_MARKER
    #  return 'Computer'
    # end
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(CPU_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def joinor(arr, delim = ', ', word = 'or')
  phrase = arr.join(delim)
  phrase[-2] = " #{word} " if arr.size > 1
  phrase
end

def cpu_ai(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(CPU_MARKER) == 2 &&
       brd.values_at(*line).count(INITIAL_MARKER) == 1
        if brd[line[0]] == INITIAL_MARKER
          return line[0]
        elsif brd[line[1]] == INITIAL_MARKER
          return line[1]
        else
          return line[2]
        end
    end
  end
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2 &&
       brd.values_at(*line).count(INITIAL_MARKER) == 1
        if brd[line[0]] == INITIAL_MARKER
          return line[0]
        elsif brd[line[1]] == INITIAL_MARKER
          return line[1]
        else
          return line[2]
        end
    end
  end
  nil
end

def place_piece!(brd, player)
  player_places_piece!(brd) if player == 'p'
  computer_places_piece!(brd) if player == 'c'
end

def alternate_player(player)
  return 'c' if player == 'p'
  'p'
end

prompt "Welcome to tic tac toe!"
prompt "You will face the computer."
prompt "First to five wins is the champion."
player_wins = 0
cpu_wins = 0
deciders = ['Player', 'Computer']
current_player = 'x'

loop do
  board = initialize_board
  
  decider = deciders.sample
  prompt "We have randomly chosen #{decider} to decide who goes first!"
  if decider == 'Player'
    loop do
      prompt "Please input 'p' for the player, 'c' for the computer."
      current_player = gets.chomp
      break if current_player == 'p' || current_player == 'c'
      prompt "what did you just say to me"
    end
  else
    current_player = 'c'
  end
  
  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    winner = detect_winner(board)
    prompt "#{winner} won!"
    if winner == 'Player'
      player_wins += 1
    else
      cpu_wins += 1
    end
  else
    prompt "It's a tie!"
  end 
  
  prompt "Current wins: Player #{player_wins}, Computer #{cpu_wins}."
  break if player_wins >= 5 || cpu_wins >= 5
  prompt "Press n to quit"
  answer = gets.chomp
  break if answer.downcase == 'n'
end

prompt "Thanks for playing!"
