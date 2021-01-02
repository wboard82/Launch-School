class Player
  attr_accessor :move, :name, :score, :history

  def initialize
    @score = 0
    @history = []
    set_name
  end

  def to_s
    name
  end

  def increment_score
    self.score += 1
  end

  def record_move
    history << move.value
  end

  def display_history
    puts "#{self} ended up with #{score} points by playing these moves:"
    history.each_with_index do |move, index|
      puts "#{index + 1}. #{move}"
    end
    puts
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
    self.move = MoveFactory.new_move(choice)
    record_move
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = MoveFactory.new_move
    record_move
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

  def >(other_move)
    self.beat?(other_move.value)
  end

  def <(other_move)
    other_move.beat?(self.value)
  end

  def to_s
    value
  end
end

class Rock < Move
  def initialize
    super('rock')
  end

  def beat?(type)
    ['scissors', 'lizard'].include?(type)
  end
end

class Paper < Move
  def initialize
    super('paper')
  end

  def beat?(type)
    ['rock', 'spock'].include?(type)
  end
end

class Scissors < Move
  def initialize
    super('scissors')
  end

  def beat?(type)
    ['paper', 'lizard'].include?(type)
  end
end

class Lizard < Move
  def initialize
    super('lizard')
  end

  def beat?(type)
    ['paper', 'spock'].include?(type)
  end
end

class Spock < Move
  def initialize
    super('spock')
  end

  def beat?(type)
    ['rock', 'scissors'].include?(type)
  end
end

class MoveFactory
  def self.new_move(move=nil)
    move = Move::VALUES.sample if move.nil?

    case move
    when 'rock' then Rock.new
    when 'paper' then Paper.new
    when 'scissors' then Scissors.new
    when 'lizard' then Lizard.new
    when 'spock' then Spock.new
    end
  end
end

class RPSGame
  attr_accessor :human, :computer, :winner, :history

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
  
  def clear
    system('cls') || system('clear')
  end

  def play
    display_welcome_message

    loop do
      clear
      human.choose
      computer.choose
      display_moves
      update_score
      display_winner
      display_score
      break unless play_again?
    end

    clear
    human.display_history
    computer.display_history

    display_goodbye_message
  end

  def display_welcome_message
    clear
    puts "Welcome, #{human}."
    sleep 0.75
    puts "Get ready to play #{Move.cap_list}!"
    sleep 1.5
    clear
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
    puts
  end

  def display_moves
    clear
    puts "#{human} chose #{human.move}."
    puts "#{computer} chose #{computer.move}."
    puts
  end

  def display_winner
    if winner
      puts "#{winner} won!"
    else
      puts "It's a tie!"
    end

    puts
  end

  def display_goodbye_message
    puts "Thank you for playing #{Move.cap_list}."
    puts "Goodbye, #{human}!"
  end
end

RPSGame.new.play
