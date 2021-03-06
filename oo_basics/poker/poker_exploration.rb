require 'pry'

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

class Rank
  include Comparable

  VALUES = { J: 11, Q: 12, K: 13, A: 14 }

  attr_reader :rank

  def initialize(rank)
    @rank = rank
  end

  def value
    VALUES.fetch(rank, rank)
  end

  def <=>(other)
    if other.is_a? Symbol
      value <=> VALUES.fetch(other, other)
    else
      value <=> other.value
    end
  end

  def to_s
    case rank
    when :J then "J"
    when :Q then "Q"
    when :K then "K"
    when :A then "A"
    else rank.to_s
    end
  end

  def name
    case rank
    when :J then "Jack"
    when :Q then "Queen"
    when :K then "King"
    when :A then "Ace"
    else rank.to_s
    end
  end
end

class Card
  include Comparable
  attr_reader :suit

  RANKS = { :A => Rank.new(:A),
            :K => Rank.new(:K),
            :Q => Rank.new(:Q),
            :J => Rank.new(:J),
            10 => Rank.new(10),
            9 => Rank.new(9),
            8 => Rank.new(8),
            7 => Rank.new(7),
            6 => Rank.new(6),
            5 => Rank.new(5),
            4 => Rank.new(4),
            3 => Rank.new(3),
            2 => Rank.new(2) }


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
    @rank = RANKS[rank]
    @suit = suit
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

  def <=>(other)
    value <=> other.value
  end

  def value
    rank.value
  end

  def rank
    @rank
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

  def initialize(dealt_cards = [])
    @cards = dealt_cards.clone
  end

  def <<(card)
    @cards << card
  end

  def print
    puts to_s

    puts
  end

  def to_s
    hand_string = ""
    split_cards = cards.map { |card| card.to_s.lines(chomp: true) }

    0.upto(6) do |idx|
      hand_string << split_cards.map { |card| card[idx] }.join(" ")
      hand_string << "\n"
    end

    hand_string
  end

  def size
    @cards.size
  end

  def empty?
    @cards.empty?
  end

  def +(other)
    Hand.new(@cards + other.cards)
  end

  def discard(discards = [])
    if discards.empty?
      @cards = []
    end
    #!!! create more logic for discarding certain cards
  end
end

class PokerHand < Hand
  include Comparable
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
      "#{evaluation}, #{cards.max.rank.name} high"
    when 'Four of a kind', 'Three of a kind'
      "#{evaluation}: #{rank_count.max_by { |rank, count| count }.first.name}s"
    when 'Full house'
      "#{evaluation}: #{rank_count.key(3).name}s and #{rank_count.key(2).name}s"
    when 'Two pair'
      "#{evaluation}: #{rank_count.filter_map {|rank, count| rank.name if count == 2}.join('s and ')}s"
    when 'Pair'
      "#{evaluation} of #{rank_count.key(2).name}s"
    when 'High card'
      "#{cards.max.rank.name} high"
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

    progressive_compare(other)
  end

  protected

  def progressive_compare(other)
    4.downto(1) do |count|
      comp = ranks_with_count_of(count) <=> other.ranks_with_count_of(count)
      return comp unless comp == 0
    end

    0
  end

  def ranks_with_count_of(goal_count)
    ranks = []
    rank_count.each { |rank, count| ranks << rank if count == goal_count }
    ranks.sort { |a, b| b <=> a }
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

