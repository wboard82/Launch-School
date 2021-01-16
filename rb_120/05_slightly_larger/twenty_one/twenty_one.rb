require 'pry'
=begin
Design choices:
- Separate out the "playing" aspects of the dealer from the "dealing" aspects
- Hand is a separate class that each player has one of
- Deck does not deal, the thing you can call on a Deck is to draw_card
- Game is really the coordinator, takes care of the dealing and taking turns
- This way the player and the deck are unaware of each other
-

=end
class Card
  attr_reader :rank, :suit

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

  def value
    case rank
    when :A then 11
    when :K, :Q, :J then 10
    else rank
    end
  end

  def symbol
    case suit
    when :Spades then '♠'
    when :Diamonds then '♦'
    when :Hearts then '♥'
    when :Clubs then '♣'
    end
  end

  def to_s
    <<~CARD
      ┌───────┐
      |#{rank.to_s.ljust(7)}|
      |       |
      |#{symbol.center(7)}|
      |       |
      |#{rank.to_s.rjust(7)}|
      └───────┘
    CARD
  end
end

class Deck
  RANKS = [:A, :K, :Q, :J, 10, 9, 8, 7, 6, 5, 4, 3, 2]
  SUITS = [:Hearts, :Diamonds, :Clubs, :Spades]

  def initialize
    @deck = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        @deck << Card.new(rank, suit)
      end
    end
    @deck.shuffle!
  end

  def draw_card
    @deck.pop
  end
end

class Hand
  attr_reader :hand

  def initialize
    @hand = []
  end

  def total
    aces_count = @hand.count { |card| card.rank == :A }
    total = @hand.inject(0) { |sum, card| sum + card.value }

    while total > 21 && aces_count > 0
      total -= 10
      aces_count -= 1
    end

    total
  end

  def <<(card)
    @hand << card
  end

  def list_cards
    @hand.map(&:to_s)
  end

  def display(hide_card: false)
    split_cards = if hide_card
                    [hand.first.to_s.split("\n"), Card::BACK.split("\n")]
                  else
                    hand.map { |card| card.to_s.split("\n") }
                  end

    0.upto(6) do |idx|
      puts split_cards.map { |card| card[idx] }.join("  ")
    end
  end
end

class Player
  attr_reader :hand, :name

  def initialize(name)
    @name = name
    @hand = Hand.new
  end

  def busted?
    hand.total > 21
  end

  def take_turn
    loop do
      answer = decide
      hit if answer == 'h'
      break if answer == 's'
    end
  end

  def display_hand
    puts "#{name} has:"
    hand.display
  end

  def score
    hand.total
  end

  def display_score
    puts "#{name} has #{hand.total}"
  end

  def <<(card)
    hand << card
  end

  def >(other)
    hand.total > other.hand.total
  end
end

class Human < Player
  def initialize
    super("Human")
  end

  def hit?
    puts "You have #{score}."
    puts "Would you like to (h)it or (s)tay?"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if %w(h s hit stay).include?(answer)
      puts "Please enter 'h' or 's'."
    end
    answer[0] == 'h'
  end
end

class Dealer < Player
  attr_reader :hide_card

  def initialize
    @hide_card = true
    super("Dealer")
  end

  def flip_card
    @hide_card = false
  end

  def hit?
    sleep 2
    hand.total <= 16
  end

  def display_hand
    puts "#{name} has:"
    hand.display(hide_card: hide_card)
  end
end

class Game
  attr_reader :deck, :human, :dealer, :current_player

  def initialize
    @deck = Deck.new
    @human = Human.new
    @dealer = Dealer.new
    @current_player = human
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def display_welcome
    clear_screen
    puts "*****************************"
    puts "*** Welcome to Twenty-One ***"
    puts "*****************************"
    sleep 2
  end

  def next_player
    @current_player = dealer
  end

  def deal_initial_cards
    2.times do
      human << deck.draw_card
      dealer << deck.draw_card
    end
  end

  def display_cards
    dealer.display_hand
    puts
    human.display_hand
    puts
  end

  def clear_and_display_cards
    clear_screen
    display_cards
  end

  def play
    display_welcome
    deal_initial_cards
    current_player_turn
    next_player
    current_player_turn unless human.busted?
    display_result
  end

  def current_player_turn
    dealer.flip_card if @current_player == dealer

    loop do
      clear_and_display_cards
      break if current_player.busted?
      break unless hit?
    end

    sleep 1.5
  end

  def hit?
    if current_player.hit?
      display_player_choice('hits')
      sleep 1.5
      current_player << deck.draw_card
      true
    else
      display_player_choice('stays')
      false
    end
  end

  def display_player_choice(choice)
    puts "#{current_player.name} #{choice} on #{current_player.score}"
    puts
  end

  def display_result
    display_score
    display_winner
    puts
  end

  def display_score
    if human.busted?
      puts "YOU BUSTED!"
    elsif dealer.busted?
      puts "DEALER BUSTED!"
    else
      puts "Dealer has #{dealer.score}."
      puts "You have #{human.score}."
    end
  end

  def display_winner
    case winner
    when human then puts "You won!"
    when dealer then puts "Dealer wins!"
    else puts "It's a push!"
    end
  end

  def winner
    if human.busted? then dealer
    elsif dealer.busted? then human
    elsif dealer > human then dealer
    elsif dealer.busted? then human
    end
  end
end

Game.new.play
