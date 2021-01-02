require 'pry'

class Player
  attr_accessor :move, :name, :score

  def initialize
    @score = 0
    set_name
  end

  def to_s
    name
  end

  def increment_score
    self.score += 1
  end
end

class Human < Player
  def set_name
    n = nil
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose #{Move.or_list}:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class Move
  attr_reader :value

  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def self.or_list
    VALUES[0..-2].join(', ') + ', or ' + VALUES[-1]
  end

  def self.cap_list
    VALUES.map(&:capitalize).join(', ')
  end

  def initialize(move)
    @value = move
  end

  def scissors?
    value == 'scissors'
  end

  def rock?
    value == 'rock'
  end

  def paper?
    value == 'paper'
  end

  def spock?
    value == 'spock'
  end

  def lizard?
    value == 'lizard'
  end

  def >(other)
    scissors? && (other.paper? || other.lizard?) ||
      paper? && (other.rock? || other.spock?) ||
      rock? && (other.scissors? || other.lizard?) ||
      lizard? && (other.spock? || other.paper?) ||
      spock? && (other.rock? || other.scissors?)
  end

  def <(other)
    other > self
  end

  def to_s
    value
  end
end

class Rule
  def initialize
    # unsure?
  end
end

class RPSGame
  attr_accessor :human, :computer, :winner

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play_again?
    answer = nil

    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    answer == 'y'
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_moves
      update_score
      display_winner
      display_score
      break unless play_again?
    end

    display_goodbye_message
  end

  def display_welcome_message
    puts "Welcome, #{human}."
    puts "Get ready to play #{Move.cap_list}!"
  end
  
  def update_score
    if human.move > computer.move
      human.increment_score
      self.winner = human
    elsif human.move < computer.move
      computer.increment_score
      self.winner = computer
    else
      self.winner = nil
    end
  end

  def display_score
    puts "#{human} has #{human.score} points."
    puts "#{computer} has #{computer.score} points."
  end

  def display_moves
    puts "#{human} chose #{human.move}."
    puts "#{computer} chose #{computer.move}."
  end

  def display_winner
    if winner then puts "#{winner} won!"
    else puts "It's a tie!"
    end
  end

  def display_goodbye_message
    puts "Thank you for playing #{Move.cap_list}."
    puts "Goodbye, #{human}!"
  end
end

RPSGame.new.play


=begin
class Move
  attr_reader :value

  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def to_s
    value
  end
end

class Rock < Move
  def initialize
    @value = 'rock'
  end
end

class Paper < Move
  def initialize
    @value = 'paper'
  end
end

class Scissors < Move
  def initialize
    @value = 'scissors'
  end
end

class Lizard < Move
  def initialize
    @value = 'lizard'
  end
end

class Spock < Move
  def initialize
    @value = 'spock'
  end
end
=end
