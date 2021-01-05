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

  def reset_score
    self.score = 0
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

  def play
    display_welcome_message
    set_up_human

    loop do
      select_computer
      input_best_of
      display_pregame_message

      @grand_winner = nil
      loop do
        play_round
        break if best_of_winner?
      end

      display_best_of_winner
      display_history if display_history?

      break unless play_again?
      human.reset_score
    end

    display_goodbye_message
  end

  private

  attr_accessor :human, :computer, :winner, :history

  def clear
    system('cls') || system('clear')
  end

  def yes_or_no
    answer = nil
    loop do
      answer = gets.chomp
      break if ['y', 'n', 'yes', 'no'].include? answer.downcase
      puts "Sorry, must be y or n."
    end
    answer[0] == 'y'
  end

  def display_welcome_message
    clear
    puts "Welcome to #{NAME_OF_GAME}." 
    puts
  end

  def set_up_human
    @human = Human.new
  end

  def display_rules
    puts "#{NAME_OF_GAME} is a two-player game, you vs. the computer."
    puts "You will each choose a move and then that round is judged."
    puts "Each move can beat two other moves, lose to two other moves, or tie with the same move."
    puts "You can play a single game tournament or one that is best of up to 9 games."
  end

  def select_computer
    clear
    puts "Which computer would you like to play against, #{human}?"
    puts " 1. R2D2 - (very consistent)"
    puts " 2. Hal - (gets into a rhythm)"
    puts " 3. Chappie - (sticks with a winner)"
    puts " 4. Sonny - (only trusts inanimate objects)"
    puts " 5. Number 5 - (has its own preferences)"
    choice = nil
    loop do
      print "=> "
      choice = gets.chomp
      break if ['1', '2', '3', '4', '5'].include?(choice)
      puts "Sorry, invalid entry. Please enter a number 1-5."
    end

    @computer = case choice
                when '1' then R2D2.new
                when '2' then Hal.new
                when '3' then Chappie.new
                when '4' then Sonny.new
                when '5' then Number5.new
                end
  end

  def input_best_of
    clear
    puts "Would you like to play best of 1, 3, 5, 7, or 9?"
    input = nil
    loop do
      print "=> "
      input = gets.chomp
      break if ['1', '3', '5', '7', '9'].include?(input)
      puts "Please enter 1, 3, 5, 7, or 9."
    end

    @best_of = input.to_i
  end

  def display_pregame_message
    clear
    puts "Okay, #{human} vs. #{computer}."
    puts "Best of #{@best_of}."
    puts "Let's go!"
    sleep 2
    clear
  end
  
  def play_round
    human.choose
    computer.choose
    display_moves
    update_score
    display_winner
    display_score
  end
  
  def best_of_winner?
    goal = @best_of / 2 + 1
    human.score >= goal || computer.score >= goal
  end

  def display_best_of_winner
    sleep 0.75
    if winner == human
      puts "*** Congratulations! You have won the best of #{@best_of} game! ***"
    else
      puts "*** #{computer} has won the best of #{@best_of} game! ***"
    end
  end

  def display_history?
    sleep 0.75
    puts
    puts "Would you like to see the moves each player played? (y/n)"
    yes_or_no
  end

  def display_history
    clear
    human.display_history
    computer.display_history
  end

  def play_again?
    puts "Would you like to play again? (y/n)"
    yes_or_no
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
    sleep 0.75
    if winner
      puts "#{winner} won!"
    else
      puts "It's a tie!"
    end
    puts
  end

  def display_goodbye_message
    clear
    puts "Thanks for playing #{NAME_OF_GAME}"
    puts "Goodbye, #{human}!"
  end
end

RPSGame.new.play
