class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end

  def to_s
    name
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
      puts "Please choose rock, paper, or scissors:"
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
  attr_reader :move

  include Comparable

  VALUES = ['rock', 'paper', 'scissors']

  MOVE_RESULTS = {
    'rock' => { 'rock' => 0, 'scissors' => 1, 'paper' => -1 },
    'paper' => { 'rock' => 1, 'scissors' => -1, 'paper' => 0 },
    'scissors' => { 'rock' => -1, 'scissors' => 0, 'paper' => 1 }
  }

  def initialize(move)
    @move = move
  end

  def <=>(other)
    MOVE_RESULTS[move][other.move]
  end

  def to_s
    move
  end
end

class Rule
  def initialize
    # unsure?
  end
end

def compare(move1, move2)
  # probably needs to use the Rule class
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new(:computer)
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
      display_winner
      break unless play_again?
    end

    display_goodbye_message
  end

  def display_welcome_message
    puts "Welcome, #{human}. Get ready to play Rock, Paper, Scissors!"
  end

  def display_winner
    puts "#{human} chose #{human.move}."
    puts "#{computer} chose #{computer.move}."
    case human.move <=> computer.move
    when 1 then puts "#{human} won!"
    when -1 then puts "#{computer} won!"
    when 0 then puts "It's a tie!"
    end
  end

  def display_goodbye_message
    puts "Thank you for playing Rock, Paper, Scissors. Goodbye, #{human}!"
  end
end

RPSGame.new.play
