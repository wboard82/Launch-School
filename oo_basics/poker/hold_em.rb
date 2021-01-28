require './poker_exploration.rb'
require 'pry'

class HoldEmGame
  include Inputable

  def initialize
    @players = []
    @board = Hand.new
  end

  def play
    display_welcome
    num_of_players = input_num_of_players
    create_players(num_of_players)
    loop do
      play_hand
      break unless play_again?
    end
  end

  private

  def display_welcome
    clear_screen
    puts "*" * 30
    puts "*" + "Welcome to Texas Hold-Em".center(28) + "*"
    puts "*" * 30
    puts
    press_any_key("Press any key to begin...")
  end

  def input_num_of_players
    low = 1
    high = 5
    clear_screen
    puts "How many players would you like to play with today? (#{low} - #{high})"
    user_input_integer(low..high)
  end

  def create_players(num_of_players)
    1.upto(num_of_players) do |num|
      puts "What is the name of Player #{num}?"
      name = nil
      loop do
        name = gets.strip
        break unless name.empty?
        puts "You must enter a non-blank name."
      end

      @players << Player.new(name)
    end
  end

  def play_hand
    initial_deal
    display_cards
    betting_round
    deal_flop
    display_cards
    betting_round
    deal_turn
    display_cards
    betting_round
    deal_river
    display_cards
    betting_round
    winner = determine_winner
    display_winner(winner)
  end

  def play_again?
    puts "Would you like to play again? (y/n)"
    user_input_choice(['y', 'n']) == 'y'
  end

  def display_cards
    clear_screen
    display_board
    display_hands
  end

  def display_board
    return if @board.empty?
    puts "On the board: "
    @board.print
  end

  def display_hands
    split_players = @players.map { |player| player.to_s.lines(chomp: true) }

    0.upto(7) do |idx|
      puts split_players.map { |player| player[idx] }.join("  |  ")
    end
    puts
  end

  def determine_winner
    best_hands = @players.map do |player|
      best_hand = PokerHand.best_hand(player.hand + @board)
      [player.name, best_hand]
    end.to_h

    winning_hand = best_hands.values.max

    best_hands.filter { |player, hand| hand == winning_hand }.to_h
  end

  def display_winner(winner)
    if winner.size > 1
      puts "#{join_or(winner.keys, last: "and")} split the pot with #{winner.values.first.describe}"
    else
      puts "#{winner.keys.first} wins with a #{winner.values.first.describe}"
    end
  end

  def betting_round
    puts
    press_any_key("Press any key to continue...")
  end

  def new_deck
    @deck = Deck.new
  end

  def initial_deal
    new_deck

    @players.each { |player| player.fresh_hand }
    @board.discard

    2.times do
      @players.each { |player| player << @deck.draw }
    end
  end

  def deal_flop
    burn_card
    3.times do
      @board << @deck.draw
    end
  end

  def deal_turn
    burn_card
    @board << @deck.draw
  end

  def deal_river
    burn_card
    @board << @deck.draw
  end

  def burn_card
    @deck.draw
    nil
  end
end

class Player
  attr_reader :name, :hand

  def initialize(name)
    @name = name
    @hand = Hand.new
  end

  def <<(card)
    @hand << card
  end

  def to_s
    hand_string = @hand.to_s
    hand_width = hand_string.lines.first.size - 1
    "#{hand_string}#{@name.center(hand_width)}"
  end

  def display
    puts @name
    @hand.print
  end

  def fresh_hand
    @hand.discard
  end

end

HoldEmGame.new.play
