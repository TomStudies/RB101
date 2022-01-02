# Tic Tac Toe Game
=begin
Process as described in LS
1. Display the initial empty 3x3 board.
2. Ask the user to mark a square.
3. Computer marks a square.
4. Display the updated board state.
5. If winner, display winner.
6. If board is full, display tie.
7. If neither winner nor board is full, go to #2
8. Play again?
9. If yes, go to #1
10. Good bye!

Board should look like:
  1 2 3
A X|X|X
  =|=|=
B X|X|X
  =|=|=
C X|X|X

1. Display the initial empty 3x3 board
  A. Store the empty game board as a unversal string EMPTY_BOARD
  B. Store the winning combinations as a universal 2D array
  B. In main game loop, assign working_board to EMPTY_BOARD
  C. Display the working_board
2. Ask the user to mark a square
  A. Explain the rules of marking (string input, A1 - C3. Not case sensitive.)
  B. Accept and verify the input
  C. Make the according change to the game board
  D. Pop from available squares into played squares
  E. Display the gameboard
  F. Check if the players squares match the winning combinations
    G. If so, winner
    H. If not, check if available squares is empty
      I. If so, end, if not, keep playing
3. Computer marks a square
  A. Check available squares to mark (based on an array with strings, removed)
  B. Mark a square at random
  C. Pop from available squares into computer squares
  D. Display the gameboard
  E. Check if the computer squares match the winning combinations
    F. If so, winner
    H. If not, check if available squares is empty
      I. If so, end, if not, keep playing
=end

EMPTY_BOARD = " | | \n=|=|=\n | | \n=|=|=\n | | ".freeze
INDEX_KEYS = {'A1' => 0, 'A2' => 2, 'A3' => 4, 'B1' => 12, 'B2' => 14, 
'B3' => 16, 'C1' => 24, 'C2' => 26, 'C3' => 28}
WINNING_COMBOS = [['A1', 'A2', 'A3'], ['B1', 'B2', 'B3'], ['C1', 'C2', 'C3'],
['A1', 'B1', 'C1'], ['A2', 'B2', 'C2'], ['A3', 'B3', 'C3'], ['A1', 'B2', 'C3'],
['A3', 'B2', 'C1']]

def win?(held_spots)
  if held_spots.size < 3
    return false
  elsif held_spots.size >= 3 && held_spots.size < 6
    WINNING_COMBOS.each do |combo|
      return true if combo.all? { |space| held_spots.include?(space) }
    end
  else
    puts "held_spots too large error."
  end
  return false
end

game_counter = 0
scoreboard = [0, 0]

loop do
  game_counter += 1
  game_board = ''
  game_board << EMPTY_BOARD
  computer_spots = []
  human_spots = []
  available_spots = ['A1', 'A2', 'A3', 'B1', 'B2', 'B3', 'C1', 'C2', 'C3']
  order = 0
  
  puts "Welcome to tic tac toe!"
  puts "Round: #{game_counter}"
  puts "Score: Human wins #{scoreboard[0]}, Computer wins #{scoreboard[1]}."
  puts "-----------------------------------------------------------------------"
  puts "Randomizing who will go first... "
  if [1,2].sample == 1
    puts "Computer goes first! Computer is X, human is O."
    order = 1
  else
    puts "Human goes first! Human is O, computer is X."
    order = 2
  end
  
  puts game_board
  loop do
    if order == 1
      computer_move = available_spots.sample
      computer_spots << computer_move
      available_spots.delete_at(available_spots.index(computer_move))
      puts "Computer plays in #{computer_move}!"
      game_board[INDEX_KEYS[computer_move]] = 'X'
      puts game_board
      if win?(computer_spots)
        puts "Computer wins! Better luck next time."
        scoreboard[1] += 1
        break
      end
      order = 2
    else
      human_move = ''
      loop do
        puts "It is the human's turn! Please input your desired space."
        puts "Rows are labeled A, B, C. Columns are labeled 1, 2, 3."
        puts "The top left corner would be 'A1'. The bottom right would be 'C3'."
        human_move = gets.chomp.upcase
        break if INDEX_KEYS.keys.include?(human_move)
        puts "Incorrect input..."
      end
      human_spots << human_move
      available_spots.delete_at(available_spots.index(human_move))
      puts "Human plays in #{human_move}!"
      game_board[INDEX_KEYS[human_move]] = 'O'
      puts game_board
      if win?(human_spots)
        puts "Human wins! Congratulations!"
        scoreboard[0] += 1
        break
      end
      order = 1
    end
    if available_spots.empty?
      puts "It's a tie! Nobody wins!"
      break
    end
  end
  
  playagain = ''
  loop do
    puts "Play again? Y/N"
    playagain = gets.chomp.upcase
    break if playagain == 'Y' || playagain == 'N'
    puts "Could not parse your input..."
  end
  break if playagain == 'N'
end
puts "Thanks for playing!"
puts "Final score: Human wins #{scoreboard[0]}, Computer wins #{scoreboard[1]}."