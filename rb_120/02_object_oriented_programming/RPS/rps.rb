require 'pry'
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
    input = nil
    puts "What's your name?"
    loop do
      print "=> "
      input = gets.chomp
      break unless input.empty?
      puts "Sorry, must enter a value."
    end
    self.name = input
  end

  def choose
    choice = nil
    puts "Please choose a move:"
    puts MoveGenerator::MOVE_MENU

    loop do
      print "=> "
      choice = gets.chomp
      break if MoveGenerator.valid_input?(choice)
      puts "Sorry, invalid choice. Please try again."
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
    @move_generator.repeat = (won? || tied?)
    self.move = @move_generator.new_move
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
  MOVES = {
    'r' => 'rock',
    'p' => 'paper',
    's' => 'scissors',
    'l' => 'lizard',
    'k' => 'spock'
  }

  MOVE_MENU = MOVES.map {|abbrev, move| "#{abbrev} = #{move}"}.join("\n")
  VALID_INPUTS = MOVES.flatten
  VALUES = MOVES.values
  ABBREVS = MOVES.keys

  attr_writer :repeat

  def self.valid_input?(choice)
    choice = choice.downcase
    VALID_INPUTS.include?(choice)
  end

  def initialize
    @weighted_moves = VALUES.clone
    @new_move_every = 1
    @last_move = nil
    @move_count = 0
  end

  def weight_move(move, weight)
    @weighted_moves.delete(move)
    @weighted_moves.concat([move] * weight)
  end

  def new_move(input=nil)
    if repeat_last_move?
      move = @last_move
    elsif input.nil?
      move = @weighted_moves.sample
    elsif input.size == 1
      move = MOVES[input] 
    else
      move = input
    end

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
    (@move_count % @new_move_every != 0) || @repeat
  end
end

class RPSGame
  NAME_OF_GAME = MoveGenerator::VALUES.map(&:capitalize).join(', ')

  def initialize
  end

  def play
    set_up_game

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

  attr_accessor :human, :computer, :winner, :history

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
    puts "Welcome to #{NAME_OF_GAME}." 
  end

  def set_up_game
    clear
    display_welcome_message
    @human = Human.new
    clear
    @computer = select_computer
    puts "Okay, let's play!"
    sleep 1
  end

  def select_computer
    puts "Which computer would you like to play against, #{human}?"
    puts " 1. R2D2 (very consistent)"
    puts " 2. Hal (gets into a rhythm)"
    puts " 3. Chappie (sticks with a winner)"
    puts " 4. Sonny (only trusts inanimate objects)"
    puts " 5. Number 5 (has its own preferences)"
    choice = nil
    loop do
      print "=> "
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
    puts "Thanks for playing #{NAME_OF_GAME}"
    puts "Goodbye, #{human}!"
  end
end

RPSGame.new.play
