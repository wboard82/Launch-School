require 'io/console'

PROMPT = '=> '
SUITS = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
VALUES = ['Ace', 'King', 'Queen', 'Jack', 10, 9, 8, 7, 6, 5, 4, 3, 2]
GOAL = 21
NAME_OF_GAME = "Twenty-One"
DEALER_STAY = 17
HANDS_TO_WIN = 2

def prompt(msg)
  puts PROMPT + msg
end

def user_prompt(prompt: PROMPT)
  print prompt
end

def clear
  system('clear') || system('cls')
end

def press_key_to_continue
  prompt "Press any key to continue"
  STDIN.getch
end

def display_welcome
  clear
  puts "***** Welcome to #{NAME_OF_GAME} *****"
  puts
  puts "Player with the highest total without going over #{GOAL} wins."
  puts "Dealer must hit on #{DEALER_STAY - 1} and stay on #{DEALER_STAY}."
  puts
  press_key_to_continue
end

def initialize_deck
  deck = []
  SUITS.each do |suit|
    VALUES.each do |value|
      deck << { suit: suit, value: value }
    end
  end
  deck.shuffle
end

def card_value(card)
  case card[:value]
  when 'Ace' then 11
  when 'King' then 10
  when 'Queen' then 10
  when 'Jack' then 10
  else card[:value]
  end
end

def sum_cards(cards)
  cards.inject(0) { |sum, card| sum + card_value(card) }
end

def count_aces(cards)
  cards.count { |card| card[:value] == 'Ace' }
end

def adjust_for_aces!(hand)
  aces_count = count_aces(hand[:cards])

  until hand[:total] <= GOAL || aces_count == 0
    hand[:total] -= 10
    aces_count -= 1
  end
end

def update_total!(hand)
  hand[:total] = sum_cards(hand[:cards])
  adjust_for_aces!(hand)
end

def busted?(hand)
  hand[:total] > GOAL
end

def hit!(hand, deck)
  deal_to!(hand, deck)
end

def joinor(list, delim = ',', final = 'and')
  if list.size == 1
    return list[0].to_s
  elsif list.size == 2
    return "#{list[0]} #{final} #{list[1]}"
  end

  "#{list[0..-2].join(delim + ' ')}#{delim} #{final} #{list[-1]}"
end

def display_dealer(hands, hide: true)
  if hide
    puts "#{hands[:dealer][:preface]} \
#{card_to_s(hands[:dealer][:cards][0])} and ??"
  else
    display_hand(hands[:dealer])
  end
end

def display_hands(hands, hide: true)
  clear
  puts
  display_dealer(hands, hide: hide)
  display_player(hands)
  puts
end

def display_player(hands)
  display_hand(hands[:player])
end

def display_hand(hand)
  hand_strings = hand[:cards].map { |card| card_to_s(card) }
  puts "#{hand[:preface]} #{joinor(hand_strings)}  (Total: #{hand[:total]})"
end

def card_to_s(card, display_suit=false)
  string = card[:value].to_s
  string << " of #{card[:suit]}" if display_suit
  string
end

def deal_to!(hand, deck)
  hand[:cards] << deck.pop
  update_total!(hand)
end

def throw_away_hands(hands)
  hands[:player][:cards] = []
  hands[:dealer][:cards] = []
end

def initial_deal!(hands, deck)
  2.times do
    deal_to!(hands[:player], deck)
    deal_to!(hands[:dealer], deck)
  end
end

def ask_hit_or_stay
  prompt "Would you like to (h)it or (s)tay?"
  answer = ''
  loop do
    user_prompt
    answer = gets.chomp.downcase
    break if ['h', 'hit', 's', 'stay'].include?(answer)
    prompt "Invalid choice. Please try again."
  end

  answer[0]
end

def player_turn!(hands, deck)
  loop do
    hit_or_stay = ask_hit_or_stay
    break if hit_or_stay == 's'
    puts "You chose to hit on #{hands[:player][:total]}..."
    sleep 1.5
    hit!(hands[:player], deck)
    return if busted?(hands[:player])
    display_hands(hands)
  end

  prompt "You chose to stay on #{hands[:player][:total]}."
  sleep 1.5
  prompt "Computer's turn..."
  sleep 1.5
end

def display_bust_message
  prompt "You busted! The computer wins!"
end

# rubocop:disable Metrics/AbcSize
def dealer_turn!(hands, deck)
  while hands[:dealer][:total] < DEALER_STAY
    display_hands(hands, hide: false)
    sleep 1.5
    prompt "Dealer will hit on #{hands[:dealer][:total]}..."
    sleep 1.5
    hit!(hands[:dealer], deck)
  end

  display_hands(hands, hide: false)

  if !busted?(hands[:dealer])
    prompt "Dealer stays on #{hands[:dealer][:total]}."
    sleep 2
  end
end
# rubocop:enable Metrics/AbcSize

def display_totals(hands)
  prompt "Dealer's total: #{hands[:dealer][:total]}."
  prompt "Your total: #{hands[:player][:total]}."
end

def display_winner(winner, hands)
  case winner
  when :player_busted then prompt "YOU BUSTED! Computer wins!"
  when :dealer_busted then prompt "DEALER BUSTED! YOU WIN!"
  when :player then prompt "You WIN with #{hands[:player][:total]}!"
  when :dealer then prompt "Dealer wins with #{hands[:dealer][:total]}!"
  when :push then prompt "It's a push."
  end
  sleep 1
end

def determine_winner(hands)
  player_total = hands[:player][:total]
  dealer_total = hands[:dealer][:total]

  if busted?(hands[:player]) then :player_busted
  elsif busted?(hands[:dealer]) then :dealer_busted
  elsif dealer_total > player_total then :dealer
  elsif player_total > dealer_total then :player
  else :push
  end
end

def update_score!(score, winner)
  case winner
  when :player_busted then score[:dealer] += 1
  when :dealer_busted then score[:player] += 1
  when :player then score[:player] += 1
  when :dealer then score[:dealer] += 1
  end
end

def display_score(score)
  puts
  puts "*-------------------------------------------*"
  puts "|   SCORE   | Dealer: #{score[:dealer]}     \
| You: #{score[:player]}        |"
  puts "*-------------------------------------------*"
  puts "(First player to win #{HANDS_TO_WIN} hands wins the round.)"
  puts
end

def display_overall_winner(score)
  sleep 1
  if score[:dealer] == HANDS_TO_WIN
    puts "The dealer is first to win #{HANDS_TO_WIN} hands."
    puts "Dealer wins this round."
  elsif score[:player] == HANDS_TO_WIN
    puts "You are first to win #{HANDS_TO_WIN} hands."
    puts "You win this round!"
  end
end

def play_again?
  puts
  prompt "Would you like to play another round? (y/n)"
  answer = ''
  loop do
    user_prompt
    answer = gets.chomp
    break if ['y', 'n', 'yes', 'n'].include?(answer)
    prompt "Invalid entry. Please enter y or n."
  end

  answer.start_with?('y')
end

def display_goodbye
  puts
  prompt "Thank you for playing #{NAME_OF_GAME}."
  sleep 0.5
  prompt "Goodbye!"
  sleep 0.25
end

def someone_overall_winner?(score)
  score.values.include?(HANDS_TO_WIN)
end

# MAIN LOOP
display_welcome

loop do
  score = { player: 0, dealer: 0 }

  loop do
    deck = initialize_deck
    hands = { player: { cards: [], total: 0, preface: "  You have:" },
              dealer: { cards: [], total: 0, preface: "Dealer has:" } }

    loop do
      initial_deal!(hands, deck)
      display_hands(hands)
      player_turn!(hands, deck)

      dealer_turn!(hands, deck) if !busted?(hands[:player])
      winner = determine_winner(hands)
      update_score!(score, winner)

      display_hands(hands, hide: false)
      display_winner(winner, hands)
      display_score(score)

      break if someone_overall_winner?(score)
      throw_away_hands(hands)
      press_key_to_continue
    end

    display_overall_winner(score)
    break
  end
  break unless play_again?
end

display_goodbye
