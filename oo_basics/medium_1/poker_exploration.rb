module Inputable
  require 'io/console'

  def join_or(list, delim: ',', final: 'or')
    return list[0].to_s if list.size == 1
    return "#{list[0]} #{final} #{list[1]}" if list.size == 2

    "#{list[0..-2].join(delim + ' ')}#{delim} #{final} #{list[-1]}"
  end

  def user_input_choice(choices)
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if choices.include?(answer)
      puts "Please enter #{join_or(choices)}."
    end

    answer
  end

  def user_input_integer(range)
    answer = nil
    loop do
      answer = gets.chomp
      break if !answer.include?(".") && range.include?(answer.to_i)
      puts "Please enter a number from #{range.first} to #{range.last}."
    end

    answer.to_i
  end

  def press_any_key(prompt)
    print prompt
    STDIN.getch
    puts
  end

  def clear_screen
    system('clear') || system('cls')
  end
end

class Card
  include Comparable
  attr_reader :rank, :suit

  VALUES = { J: 11, Q: 12, K: 13, A: 14 }

  BACK = <<~BACK_DOC
    ┌───────┐
    │░░░░░░░│
    │░░░░░░░│
    │░░░░░░░│
    │░░░░░░░│
    │░░░░░░░│
    └───────┘
  BACK_DOC

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def self.rank_value(rank)
    self::VALUES.fetch(rank, rank)
  end

  def to_s
    <<~CARD
      ┌───────┐
      │#{rank.to_s.ljust(7)}│
      │       │
      │#{symbol.center(7)}│
      │       │
      │#{rank.to_s.rjust(7)}│
      └───────┘
    CARD
  end

  def value
    VALUES.fetch(rank, rank)
  end

  def <=>(other_card)
    value <=> other_card.value
  end

  private

  def symbol
    case suit
    when :Spades then '♠'
    when :Diamonds then '♦'
    when :Hearts then '♥'
    when :Clubs then '♣'
    end
  end
end

class Deck
  RANKS = [:A, :K, :Q, :J, 10, 9, 8, 7, 6, 5, 4, 3, 2]
  SUITS = [:Hearts, :Diamonds, :Clubs, :Spades]

  def initialize
    @cards = []
    reset
  end

  def reset
    RANKS.each do |rank|
      SUITS.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end

    @cards.shuffle!
  end

  def draw
    reset if @cards.empty?
    @cards.pop
  end
end

class Hand
  attr_reader :cards

  def initialize(dealt_cards)
    @cards = dealt_cards.clone
  end

  def print
    split_cards = cards.map { |card| card.to_s.split("\n") }

    0.upto(6) do |idx|
      puts split_cards.map { |card| card[idx] }.join("  ")
    end

    puts
  end

  def size
    @cards.size
  end


end

class PokerHand < Hand
  attr_reader :evaluation

  HAND_RANKINGS = { 'High card' => 0, 'Pair' => 1, 'Two pair' => 2,
                    'Three of a kind' => 3, 'Straight' => 4, 'Flush' => 5,
                    'Full house' => 6, 'Four of a kind' => 7,
                    'Straight flush' => 8, 'Royal flush' => 9 }

  def initialize(dealt_cards)
    super
    @rank_count = cards.map { |card| card.rank }.tally
    cards.sort! { |a, b| b <=> a }
    cards.sort! { |card1, card2| rank_count[card2.rank] <=> rank_count[card1.rank] }
    @evaluation = evaluate
  end

  def self.best_hand(hand)
    if hand.size < 5
      raise RuntimeError, "Less than 5 cards!"
    end

    hands = hand.cards.combination(5).map { |group| PokerHand.new(group) }
    hands.max
  end

  def describe
    case evaluation
    when 'Straight flush', 'Straight', 'Flush'
      "#{evaluation}, #{cards.max.rank} high"
    when 'Four of a kind', 'Three of a kind'
      "#{evaluation}: #{rank_count.max_by { |rank, count| count }.first}s"
    when 'Full house'
      "#{evaluation}: #{rank_count.key(3)}s and #{rank_count.key(2)}s"
    when 'Two pair'
      "#{evaluation}: #{rank_count.filter_map {|rank, count| rank if count == 2}.join('s and ')}s"
    when 'Pair'
      "#{evaluation} of #{rank_count.key(2)}s"
    when 'High card'
      "#{cards.max.rank} high"
    else
      evaluation
    end
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  def <=>(other)
    rank_comp = HAND_RANKINGS[evaluation] <=> HAND_RANKINGS[other.evaluation]
    return rank_comp unless rank_comp == 0

    if straight?
      straight_high_card <=> other.straight_high_card
    else
      progressive_compare(other)
    end
  end

  protected

  def straight_high_card
    ranks = cards.map { |card| card.rank }
    return 5 if ranks.include?(5) && ranks.include?(:A)
    cards.max.value
  end

  def progressive_compare(other)
    4.downto(1) do |count|
      comp = rank_vals_with_count_of(count) <=> other.rank_vals_with_count_of(count)
      return comp unless comp == 0
    end

    0
  end

  def rank_vals_with_count_of(goal_count)
    ranks = []
    rank_count.each { |rank, count| ranks << rank if count == goal_count }
    values = ranks.map { |rank| Card::rank_value(rank) }
    values.sort { |a, b| b <=> a }
  end

  private

  attr_reader :cards, :rank_count

  def royal_flush?
    straight_flush? && (cards.min.value == 10)
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    n_of_a_kind?(4)
  end

  def full_house?
    n_of_a_kind?(3) && n_of_a_kind?(2)
  end

  def flush?
    suit = cards.first.suit
    cards.all? { |card| card.suit == suit}
  end

  def n_of_a_kind?(number)
    rank_count.one? { |_, count| count == number }
  end

  def straight?
    return false if rank_count.any? { |_, count| count > 1 }

    return true if cards.all? { |card| card.value <= 5 || card.rank == :A }

    cards.min.value == cards.max.value - 4
  end

  def three_of_a_kind?
    rank_count.values.include?(3)
  end

  def two_pair?
    rank_count.values.count(2) == 2
  end

  def pair?
    n_of_a_kind?(2)
  end
end

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
