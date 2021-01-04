# TODO:
#  - Input validation on name
#  - Clear screen before name
#  - Order of welcome/name messages
#  - Test and try to break y/n validation
#  - Add yes/no to validation
#  - Abbreviations for moves
#  - Tournament?

class Player
  attr_reader :move, :score

  def initialize
    @score = 0
    @history = []
    @move_generator = MoveGenerator.new
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
  
  def won
    @last_result = :won
  end

  def lost
    @last_result = :lost
  end

  def tied
    @last_result = :tied
  end

  def won?
    @last_result == :won
  end

  def lost?
    @last_result == :lost
  end

  def tied?
    @last_result == :tied
  end

  def display_history
    puts "#{self} finished with #{score} points by playing these moves:"
    history.each_with_index do |move, index|
      puts "#{index + 1}. #{move}"
    end
    puts
  end

  def choose
    self.move = @move_generator.new_move
    record_move
  end

  private

  attr_writer :move, :score
  attr_accessor :name, :history
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
    self.move = @move_generator.new_move(choice)
    record_move
  end
end

class Chappie < Player
  def set_name
    self.name = 'Chappie'
  end

  def choose
    repeat_move = (won? || tied?)
    self.move = @move_generator.new_move(repeat: repeat_move)
    record_move
  end
end

class R2D2 < Player
  def initialize
    super
    @move_generator.weight_move('paper', 0)
    @move_generator.weight_move('scissors', 0)
    @move_generator.weight_move('lizard', 0)
    @move_generator.weight_move('spock', 0)
  end

  def set_name
    self.name = 'R2D2'
  end
end

class Hal < Player
  def initialize
    super
    @move_generator.set_repeat(3) 
  end

  def set_name
    self.name = 'Hal'
  end
end

class Sonny < Player
  def initialize
    super
    @move_generator.weight_move('lizard', 0)
    @move_generator.weight_move('spock', 0)
  end
  
  def set_name
    self.name = 'Sonny'
  end
end

class Number5 < Player
  def initialize
    super
    @move_generator.weight_move('rock', 1)
    @move_generator.weight_move('paper', 2)
    @move_generator.weight_move('scissors', 3)
    @move_generator.weight_move('lizard', 4)
    @move_generator.weight_move('spock', 5)
  end

  def set_name
    self.name = 'Number 5'
  end
end

class Move
  attr_reader :value

  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def initialize(move)
    @value = move
  end

  def >(other_move)
    self.beat?(other_move.value)
  end

  def <(other_move)
    other_move.beat?(self.value)
  end

  def self.or_list
    VALUES[0..-2].join(', ') + ', or ' + VALUES[-1]
  end

  def self.cap_list
    VALUES.map(&:capitalize).join(', ')
  end

  def to_s
    value.clone
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

class MoveGenerator
  def initialize
    @moves = Move::VALUES.clone
    @new_move_every = 1
    @last_move = nil
    @move_count = 0
  end

  def weight_move(move, weight)
    @moves.delete(move)
    @moves.concat([move] * weight)
  end

  def new_move(move=nil, repeat: false)
    if repeat || repeat_last_move?
      move = @last_move
    end

    move ||= @moves.sample
    @last_move = move
    @move_count += 1

    case move
    when 'rock' then Rock.new
    when 'paper' then Paper.new
    when 'scissors' then Scissors.new
    when 'lizard' then Lizard.new
    when 'spock' then Spock.new
    end
  end

  def set_repeat(times)
    @new_move_every = times
  end

  private

  def repeat_last_move?
    @move_count % @new_move_every != 0
  end
end

class RPSGame
  attr_accessor :human, :computer, :winner, :history

  def initialize
    @human = Human.new
    @computer = select_computer
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

  private

  def clear
    system('cls') || system('clear')
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
  
  def display_welcome_message
    clear
    puts "Welcome, #{human}."
    sleep 0.75
    puts "Get ready to play #{Move.cap_list}!"
    sleep 1.5
    clear
  end

  def select_computer
    puts "Which computer would you like to play against?"
    puts "1. R2D2 (very consistent)"
    puts "2. Hal (gets into a rhythm)"
    puts "3. Chappie (sticks with a winner)"
    puts "4. Sonny (only trusts inanimate objects)"
    puts "5. Number 5 (has its own preferences)"
    choice = nil
    loop do
      choice = gets.chomp
      break if ['1', '2', '3', '4', '5'].include?(choice)
      puts "Sorry, invalid entry. Please try again."
    end

    case choice
    when '1' then R2D2.new
    when '2' then Hal.new
    when '3' then Chappie.new
    when '4' then Sonny.new
    when '5' then Number5.new
    end
  end
  
  def update_score
    if human.move > computer.move
      human.increment_score
      update_winner('human')
    elsif human.move < computer.move
      computer.increment_score
      update_winner('computer')
    else
      update_winner('tied')
    end
  end

  def update_winner(winner_name)
    case winner_name
    when 'human'
      self.winner = human
      human.won
      computer.lost
    when 'computer'
      self.winner = computer
      human.lost
      computer.won
    when 'tied'
      self.winner = nil
      human.tied
      computer.tied
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
