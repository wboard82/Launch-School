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
  attr_reader :value

  VALUES = ['rock', 'paper', 'scissors']

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

  def >(other)
    (scissors? && other.paper?) || (paper? && other.rock?) ||
      (rock? && other.scissors?)
  end

  def <(other)
    (scissors? && other.rock?) || (paper? && other.scissors?) ||
      (rock? && other.paper?)
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

def compare(move1, move2)
  # probably needs to use the Rule class
end

class RPSGame
  attr_accessor :human, :computer

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
      display_winner
      break unless play_again?
    end

    display_goodbye_message
  end

  def display_welcome_message
    puts "Welcome, #{human}. Get ready to play Rock, Paper, Scissors!"
  end

  def display_moves
    puts "#{human} chose #{human.move}."
    puts "#{computer} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move then puts "#{human} won!"
    elsif human.move < computer.move then puts "#{computer} won!"
    else puts "It's a tie!"
    end
  end

  def display_goodbye_message
    puts "Thank you for playing Rock, Paper, Scissors. Goodbye, #{human}!"
  end
end

RPSGame.new.play
