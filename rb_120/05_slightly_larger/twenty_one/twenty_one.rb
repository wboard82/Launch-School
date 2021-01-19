require 'pry' #!!!
require 'io/console'

module Inputable
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

  def press_any_key(prompt)
    puts prompt
    STDIN.getch
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
end

class Card
  attr_reader :rank, :suit

  RANKS = [:A, :K, :Q, :J, 10, 9, 8, 7, 6, 5, 4, 3, 2]
  SUITS = [:Hearts, :Diamonds, :Clubs, :Spades]


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
  def initialize
    @deck = []
    Card::RANKS.each do |rank|
      Card::SUITS.each do |suit|
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
  attr_reader :hand, :name, :score

  def initialize(name)
    @name = name
    reset_score
    new_hand
  end

  def reset_score
    @score = 0
  end

  def new_hand
    @hand = Hand.new
  end

  def increment_score
    @score += 1
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

  def hand_total
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
  include Inputable

  def initialize(name)
    super
  end

  def hit?
    puts "You have #{hand_total}."
    puts "Would you like to (h)it or (s)tay?"
    answer = user_input_choice(%w(h s hit stay))
    answer[0] == 'h'
  end
end

class Dealer < Player
  attr_reader :hide_card

  def initialize
    @hide_card = true
    super("Dealer")
  end

  def new_hand
    @hide_card = true
    super
  end

  def show_card
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
  include Inputable

  attr_reader :deck, :human, :dealer, :current_player, :goal_score

  def initialize
    @dealer = Dealer.new
    @goal_score = 5
  end

  def play
    set_up_game
    loop do
      play_tournament
      break unless play_another_tournament?
    end
  end

  def set_up_game
    display_welcome
    @human = Human.new(input_name)
    @current_player = human
  end

  def input_name
    name = nil
    loop do
      print "Please enter your name: "
      name = gets.strip
      break unless name.empty?
      puts "Sorry, you must enter at least one letter or number."
    end
    name
  end

  def play_tournament
    loop do
      initial_deal
      current_player_turn
      next_player
      current_player_turn unless human.busted?
      display_result
      break if tournament_winner
    end
  end

  def tournament_winner
    if human.score == goal_score
      human
    elsif dealer.score == goal_score
      dealer
    end
  end

  def play_another_tournament?
    false
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def display_welcome
    clear_screen
    puts "*****************************"
    puts "*** Welcome to Twenty-One ***"
    puts "*****************************"
    puts
    sleep 1
  end

  def next_player
    @current_player = dealer
  end

  def initial_deal
    @deck = Deck.new
    human.new_hand
    dealer.new_hand
    @current_player = human

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

  def current_player_turn
    dealer.show_card if @current_player == dealer

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
    puts "#{current_player.name} #{choice} on #{current_player.hand_total}"
    puts
  end

  def display_result
    display_score
    display_winner
    sleep 1
    display_tournament_score
    puts
    press_any_key("Press a key to play the next game.")
  end

  def display_score
    if human.busted?
      puts "YOU BUSTED!"
    elsif dealer.busted?
      puts "DEALER BUSTED!"
    else
      puts "Dealer has #{dealer.hand_total}."
      puts "You have #{human.hand_total}."
    end
  end

  def display_winner
    case winner
    when human
      human.increment_score #!!! don't like this here, but we'll move it later
      puts "You won!"
    when dealer then
      dealer.increment_score
      puts "Dealer wins!"
    else puts "It's a push!"
    end
  end

  def display_tournament_score
    puts
    puts "#{dealer.name} has #{dealer.score}, #{human.name} has #{human.score}."
    tourney_winner = tournament_winner
    if tourney_winner
      puts "#{tourney_winner.name} won the tournament!"
    else
      puts "First player to #{goal_score} wins the tournament."
    end
  end

  def winner
    if human.busted? then dealer
    elsif dealer.busted? then human
    elsif dealer > human then dealer
    elsif human > dealer then human
    end
  end
end

Game.new.play
