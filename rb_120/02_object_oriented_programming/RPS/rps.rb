class Player
  attr_reader :move, :score

  def initialize
    @score = 0
    @history = []
    @move_generator = MoveGenerator.new
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

  def choose(choice = nil)
    self.move = move_generator.new_move(choice)
    record_move
  end

  def reset
    self.score = 0
    self.history = []
  end

  private

  attr_writer :move, :score
  attr_reader :move_generator
  attr_accessor :name, :history
end

class Human < Player
  def initialize
    super
    set_name
  end

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
    display_move_menu
    loop do
      print "=> "
      choice = gets.chomp
      break if MoveGenerator.valid_input?(choice)
      puts "Sorry, invalid choice. Please try again."
    end

    super(choice)
  end

  def display_move_menu
    puts "Please choose a move:"
    puts MoveGenerator::MOVE_MENU
  end
end

class Chappie < Player
  def initialize
    super
    @name = 'Chappie'
  end

  def choose
    move_generator.repeat = (won? || tied?)
    super
  end
end

class R2D2 < Player
  def initialize
    super
    @name = 'R2D2'
    move_generator.weight_move('paper', 0)
    move_generator.weight_move('scissors', 0)
    move_generator.weight_move('lizard', 0)
    move_generator.weight_move('spock', 0)
  end
end

class Hal < Player
  def initialize
    super
    @name = 'Hal'
    move_generator.new_move_every = 3
  end
end

class Sonny < Player
  def initialize
    super
    @name = 'Sonny'
    move_generator.weight_move('lizard', 0)
    move_generator.weight_move('spock', 0)
  end
end

class Number5 < Player
  def initialize
    super
    @name = 'Number 5'
    move_generator.weight_move('rock', 1)
    move_generator.weight_move('paper', 2)
    move_generator.weight_move('scissors', 3)
    move_generator.weight_move('lizard', 4)
    move_generator.weight_move('spock', 5)
  end
end

class Move
  attr_reader :value

  def initialize(move)
    @value = move
  end

  def >(other_move)
    beats.include?(other_move.value)
  end

  def to_s
    value.clone
  end

  private

  attr_reader :beats
end

class Rock < Move
  def initialize
    super('rock')
    @beats = ['scissors', 'lizard']
  end
end

class Paper < Move
  def initialize
    super('paper')
    @beats = ['rock', 'spock']
  end
end

class Scissors < Move
  def initialize
    super('scissors')
    @beats = ['paper', 'lizard']
  end
end

class Lizard < Move
  def initialize
    super('lizard')
    @beats = ['paper', 'spock']
  end
end

class Spock < Move
  def initialize
    super('spock')
    @beats = ['rock', 'scissors']
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

  MOVE_MENU = MOVES.map { |abbrev, move| "#{abbrev} = #{move}" }.join("\n")
  VALID_INPUTS = MOVES.flatten
  VALUES = MOVES.values
  ABBREVS = MOVES.keys

  attr_writer :repeat, :new_move_every

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
    move = if repeat_last_move? then @last_move
           elsif input.nil? then @weighted_moves.sample
           elsif input.size == 1 then MOVES[input]
           else input
           end

    @last_move = move
    @move_count += 1
    create_move(move)
  end

  private

  def create_move(move)
    case move
    when 'rock' then Rock.new
    when 'paper' then Paper.new
    when 'scissors' then Scissors.new
    when 'lizard' then Lizard.new
    when 'spock' then Spock.new
    end
  end

  def repeat_last_move?
    (@move_count % @new_move_every != 0) || @repeat
  end
end

class RPSGame
  NAME_OF_GAME = MoveGenerator::VALUES.map(&:capitalize).join(', ')

  def play
    set_up_game

    loop do
      set_up_tournament
      play_tournament
      end_tournament
      human.reset
      break unless play_again?
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
    puts "Each move beats two other moves, loses to two other moves,\
and ties with itself."
    puts "You can play a single game tournament or best of up to 9 games."
    puts
  end

  def set_up_game
    display_welcome_message
    display_rules
    set_up_human
  end

  def set_up_tournament
    select_computer
    input_tournament_length
    display_pregame_message
    @grand_winner = nil
  end

  def end_tournament
    display_tournament_winner
    display_history if display_history?
  end

  def select_computer
    display_computer_choices
    choice = nil
    loop do
      print "=> "
      choice = gets.chomp
      break if ['1', '2', '3', '4', '5'].include?(choice)
      puts "Sorry, invalid entry. Please enter a number 1-5."
    end

    @computer = new_computer(choice)
  end

  def display_computer_choices
    clear
    puts "Which computer would you like to play against, #{human}?"
    puts " 1. R2D2 - (very consistent)"
    puts " 2. Hal - (gets into a rhythm)"
    puts " 3. Chappie - (sticks with a winner)"
    puts " 4. Sonny - (only trusts inanimate objects)"
    puts " 5. Number 5 - (has its own preferences)"
  end

  def new_computer(choice)
    case choice
    when '1' then R2D2.new
    when '2' then Hal.new
    when '3' then Chappie.new
    when '4' then Sonny.new
    when '5' then Number5.new
    end
  end

  def input_tournament_length
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

  def tournament_winner?
    goal = @best_of / 2 + 1
    human.score >= goal || computer.score >= goal
  end

  def play_tournament
    loop do
      play_round
      return if tournament_winner?
    end
  end

  def display_tournament_winner
    sleep 0.75
    if winner == human
      puts "*** Congratulations! You won the tournament! ***"
    else
      puts "*** #{computer} has won the tournament! ***"
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
    elsif computer.move > human.move
      computer.increment_score
      update_winner('computer')
    else
      update_winner('tied')
    end
  end

  def update_winner(winner_name)
    case winner_name
    when 'human' then human_won
    when 'computer' then computer_won
    when 'tied' then tie
    end
  end

  def human_won
    self.winner = human
    human.won
    computer.lost
  end

  def computer_won
    self.winner = computer
    human.lost
    computer.won
  end

  def tie
    self.winner = nil
    human.tied
    computer.tied
  end

  def display_score
    puts "#{human} has #{human.score} points."
    puts "#{computer} has #{computer.score} points."
    puts
    sleep 0.75
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
