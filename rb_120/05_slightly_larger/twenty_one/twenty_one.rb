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
      │#{rank.to_s.ljust(7)}│
      │       │
      │#{symbol.center(7)}│
      │       │
      │#{rank.to_s.rjust(7)}│
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
    answer = user_input_choice(%w(h s))
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
    sleep 1.5
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
    @goal_score = nil
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
    puts
    @goal_score = input_goal_score
  end

  def input_goal_score
    low = 1
    high = 9
    puts "We will play until a player reaches #{low} to #{high} wins."
    puts "How many wins would you like to play to?"
    @goal_score = user_input_integer(low..high)
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
      2.times do
        clear_and_display_cards
        current_player_turn
        next_player
        break if human.busted?
      end
      clear_and_display_cards

      winner = winning_player
      winner&.increment_score
      display_result(winner)
      break if tournament_winner
      press_any_key("Press a key to play the next game.")
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
    case current_player
    when human
      dealer.show_card
      @current_player = dealer
    when dealer
      dealer.hide_card
      @current_player = human
    end
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
    loop do
      break unless hit?
      clear_and_display_cards
      break if current_player.busted?
    end
  end

  def hit?
    answer = false
    if current_player.hit?
      if current_player.hand_total == 21
        puts "I can't let you do that, #{human.name}."
        sleep 1
        puts "Try reading the rules again."
        sleep 1.5
        puts "#{human.name} stays."
      else
        display_player_choice('hits')
        current_player << deck.draw_card
        answer = true
      end
    else
      display_player_choice('stays')
    end
    sleep 1.5

    answer
  end

  def display_player_choice(choice)
    if current_player == human && choice == 'hits'
      adverb = case human.hand_total
               when (18..20) then ["insanely ", "crazily "].sample
               when (15..17) then ["bravely ", "boldly "].sample
               when (12..14) then ["smartly ", "wisely "].sample
               when (4..11) then ["obviously ", "clearly "].sample
               end
    end

    puts "#{current_player.name} #{adverb}#{choice} on #{current_player.hand_total}"
    puts
  end

  def display_result(winner)
    display_busted
    display_score
    display_winner(winner)
    sleep 1
    display_tournament_score
    puts
  end

  def display_busted
    if human.busted?
      puts "#{human.name.upcase} BUSTED!"
      true
    elsif dealer.busted?
      puts "#{dealer.name.upcase} BUSTED!"
      true
    end
  end

  def display_score
    unless human.busted? || dealer.busted?
      puts "Dealer has #{dealer.hand_total}."
      puts "You have #{human.hand_total}."
    end
  end

  def display_winner(winner)
    case winning_player
    when human
      puts "#{human.name} wins!"
    when dealer then
      puts "#{dealer.name} wins!"
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

  def winning_player
    if human.busted? then dealer
    elsif dealer.busted? then human
    elsif dealer > human then dealer
    elsif human > dealer then human
    end
  end
end

Game.new.play
