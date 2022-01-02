FULL_DECK = [2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6,
             7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, 'Jack', 'Jack',
             'Jack', 'Jack', 'Queen', 'Queen', 'Queen', 'Queen', 'King', 'King',
             'King', 'King', 'Ace', 'Ace', 'Ace', 'Ace'].freeze

def sum_cards(cards)
  sum = 0
  aces = 0
  cards.each do |card|
    if card.to_i == 0
      if card == 'Ace'
        sum += 11
        aces += 1
      else
        sum += 10
      end
    else
      sum += card
    end
  end
  factor_aces(sum, aces)
end

def factor_aces(sum, aces)
  loop do
    break if sum < UPPER_LIMIT || aces == 0
    sum -= 10
    aces -= 1
  end
  sum
end

def busted?(cards)
  return true if sum_cards(cards) > UPPER_LIMIT
  false
end

def print_hand(player, cards, stayflags)
  hand_string = cards.join(', ')
  if player == 'p'
    hand_string.prepend('You have: ')
  elsif player == 'd'
    hand_string.prepend('Dealer has: ')
    if stayflags < 2
      hand_string.gsub!(/ \w+\z/, ' and an unknown card')
    end
  end
  puts hand_string
end

def draw_card!(deck, hand)
  hand << deck.pop
end

player_wins = 0
dealer_wins = 0
round_num = 1
xone = ''
dealer_stop = 17

# Decide upper limit
puts "Normally, players will play up to 21."
puts "However, we allow players to play for an amount up to 181."
puts "Keep in mind you will have to play until five wins in this fashion."
loop do
  puts "Please input the amount you would like to play to."
  puts "Note: Amounts must end in 1, and be at least 21, at most 181."
  xone = gets.chomp
  break if xone.match?(/\A1?\d1\z/) && xone.to_i >= 21 && xone.to_i <= 181
end
UPPER_LIMIT = xone.to_i
dealer_stop = UPPER_LIMIT - 4

# GAMEPLAY LOOP
loop do
  system 'clear'

  # Initialize variables
  current_deck = FULL_DECK.shuffle
  player_cards = []
  dealer_cards = []
  answer = nil
  staycount = 0
  playagain = ''

  # Prepare the hands
  draw_card!(current_deck, player_cards)
  draw_card!(current_deck, dealer_cards)
  draw_card!(current_deck, player_cards)
  draw_card!(current_deck, dealer_cards)

  # Start the game
  puts "Round #{round_num}."
  puts "Current score: Player #{player_wins}, Dealer #{dealer_wins}."
  puts "Five wins makes a champion!"

  # Player's turn
  loop do
    print_hand('p', player_cards, staycount)
    print_hand('d', dealer_cards, staycount)
    break if busted?(player_cards)
    puts "hit or stay?"
    answer = gets.chomp
    if answer == 'stay'
      staycount += 1
      break
    elsif answer == 'hit'
      draw_card!(current_deck, player_cards)
    else
      puts "Invalid input."
    end
    system 'clear'
  end

  # Dealer's turn (if necessary)
  if busted?(player_cards)
    puts "You busted! Dealer wins."
    dealer_wins += 1
  else
    puts "You chose to stay! Time for the dealer's turn."
    loop do
      print_hand('p', player_cards, staycount)
      print_hand('d', dealer_cards, staycount)
      break if busted?(dealer_cards)
      if sum_cards(dealer_cards) >= dealer_stop
        puts "Dealer chooses to stay!"
        staycount += 1
        break
      else
        puts "Dealer draws!"
        draw_card!(current_deck, dealer_cards)
      end
    end
  end

  # Check if dealer busted
  if busted?(dealer_cards)
    print_hand('d', dealer_cards, 2)
    puts "Dealer busts! You win!"
    player_wins += 1
  end

  # Calculate winner
  if staycount == 2
    puts "Both players stayed! Time to put all the cards on the table..."
    print_hand('p', player_cards, staycount)
    print_hand('d', dealer_cards, staycount)
    player_sum = sum_cards(player_cards)
    dealer_sum = sum_cards(dealer_cards)
    puts "Your sum: #{player_sum}"
    puts "Dealer's sum: #{dealer_sum}"
    if player_sum > dealer_sum
      puts "You win! Congratulations!"
      player_wins += 1
    elsif dealer_sum > player_sum
      puts "Dealer wins! Darned shame."
      dealer_wins += 1
    else
      puts "A tie! Nobody wins!"
    end
  end

  # Check for five wins
  if player_wins >= 5
    puts "Current score: Player #{player_wins}, Dealer #{dealer_wins}."
    puts "You win! The dealer slinks back to his cave, defeated."
    break
  elsif dealer_wins >= 5
    puts "Current score: Player #{player_wins}, Dealer #{dealer_wins}."
    puts "The dealer smirks, basking in his victory. You return home, defeated."
    break
  end

  # See whether to do a new game or not
  loop do
    puts "Press 'y' to play again, 'n' to stop."
    playagain = gets.chomp
    break if playagain == 'y' || playagain == 'n'
    puts "Invalid input."
  end
  break if playagain == 'n'
  round_num += 1
end
