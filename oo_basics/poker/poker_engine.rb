require './poker_exploration.rb'

class PokerHandEngine
  include Inputable

  def start
    display_welcome
    loop do
      display_menu
      choice = input_choice
      break if choice == :quit
      loop do
        self.send(choice)
        puts "Do it (a)gain or back to (m)enu?"
        again = user_input_choice(['a', 'm'])
        break if again == 'm'
      end
    end

    display_goodbye
  end

  def display_welcome
    clear_screen
    puts "♣♥♦♠ Welcome to the Poker Hand Evaluator ♣♥♦♠"
    puts
    press_any_key("Press any key to continue...")
  end

  def display_menu
    clear_screen
    puts "Here are your options:"
    puts "1. See a random poker hand"
    puts "2. Compare two random poker hands"
    puts "3. Find the best possible poker hand out of a set of cards"
    puts "Or 'q' to quit"
    puts
  end

  def input_choice
    print "Please enter your choice (1, 2, 3): "
    choice = user_input_choice(['1', '2', '3', 'q'])
    case choice
    when '1' then :random
    when '2' then :compare
    when '3' then :best_hand
    when 'q' then :quit
    end
  end

  def display_goodbye
    clear_screen
    puts "♣♥♦♠ Thanks for trying the Poker Hand Evaluator ♣♥♦♠"
    puts
    puts "Goodbye!"
  end

  private

  def deal_hands(number)
    deck = Deck.new

    piles = Array.new(number) { |arr| arr = Array.new }

    5.times do
      piles.each { |pile| pile << deck.draw }
    end

    piles.map { |pile| PokerHand.new(pile) }
  end

  def deal_n_card_hand(number)
    deck = Deck.new
    pile = []
    number.times do
      pile << deck.draw
    end

    Hand.new(pile)
  end

  def random
    clear_screen
    hand = deal_hands(1).first
    puts "Here is your random hand:"
    puts
    puts hand.describe
    hand.print
  end

  def compare
    clear_screen
    hand1, hand2 = deal_hands(2)
    puts "Comparing two hands:"
    puts
    puts "Hand 1 is a #{hand1.describe}"
    hand1.print
    puts "--------------------------------------------"
    puts "Hand 2 is a #{hand2.describe}"
    hand2.print
    puts
    case hand1 <=> hand2
    when 1 then puts "Hand 1 wins!"
    when -1 then puts "Hand 2 wins!"
    when 0 then puts "They split."
    end
    puts
  end

  def best_hand
    clear_screen
    puts "Let's find out the best possible poker hand out of a certain number of cards."
    puts "How many cards would you like? (6 to 10)"
    number = user_input_integer(6..10)

    hand = deal_n_card_hand(number)
    poker_hand = PokerHand.best_hand(hand)

    clear_screen
    puts "The best 5 card poker hand out of these #{number} cards:"
    hand.print
    puts "Is a #{poker_hand.describe}:"
    poker_hand.print
  end
end

engine = PokerHandEngine.new
engine.start

