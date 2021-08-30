VALID_CHOICES = { r: 'rock', p: 'paper', s: 'scissors',
                  l: 'lizard', v: 'spock' }
GAME_LOGIC = { rock: ['scissors', 'lizard'], paper: ['rock', 'spock'],
               scissors: ['paper', 'lizard'], lizard: ['spock', 'paper'],
               spock: ['scissors', 'rock'] }

def win?(first, second)
  GAME_LOGIC[first.to_sym].include?(second)
end

def display_results(player1, player2)
  if win?(player1, player2)
    prompt("You won!\n\n")
  elsif win?(player2, player1)
    prompt("Computer won!\n\n")
  else
    prompt("It's a tie!\n\n")
  end
  puts("------------------------------------\n\n")
end

def prompt(message)
  Kernel.puts("=>" << message)
end

loop do
  prompt("Welcome to Rock Paper scissors!")
  prompt("You will play against the computer.")
  prompt("The first to win three games becomes the grand champion!\n\n")
  round = 1
  score = [0, 0]
  loop do
    prompt("Round #{round}!")
    prompt("Score: \nPlayer #{score[0]} \nComputer #{score[1]}\n\n")
    choice = ''
    loop do
      VALID_CHOICES.each do |letter, option|
        prompt("For #{option}, input #{letter}.")
      end
      choice = Kernel.gets().chomp().downcase()
      if VALID_CHOICES.key?(choice.to_sym)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.values.sample()

    prompt("You chose #{VALID_CHOICES[choice.to_sym]}, computer chose #{computer_choice}.")

    display_results(VALID_CHOICES[choice.to_sym], computer_choice)

    if win?(VALID_CHOICES[choice.to_sym], computer_choice)
      score[0] += 1
    elsif win?(computer_choice, VALID_CHOICES[choice.to_sym])
      score[1] += 1
    end

    round += 1
    break if score.include?(3)
  end

  if score[0] == 3
    prompt("Congratulations!! YOU are the GRAND CHAMPION!!")
  elsif score[1] == 3
    prompt("What bitter misfortune!! You were beaten by a mere computer, an inanimate amalgamation of cruel and uncaring metals!")
  end

  prompt("Play again? (y to continue)")
  again = gets.chomp.downcase
  break unless again == 'y'
end
