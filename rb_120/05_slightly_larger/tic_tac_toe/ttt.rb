require "pry"

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

class Board
  def self.copy(other)
    new_board = new

    (1..9).each do |idx|
      new_board[idx] = other[idx].marker
    end

    new_board
  end

  def initialize
    @squares = {}
    clear
  end

  def draw
    draw_row(1, 2, 3)
    draw_line
    draw_row(4, 5, 6)
    draw_line
    draw_row(7, 8, 9)
  end

  def clear
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def [](sqaure)
    @squares[sqaure]
  end

  def []=(square, marker)
    @squares[square].marker = marker
  end

  def unmarked_keys
    @squares.keys.filter { |key| @squares[key].unmarked? }
  end

  def list_unmarked_keys
    join_or(unmarked_keys)
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      winner = line_winning_marker(line)
      return winner if winner
    end

    nil
  end

  def find_single_empty_square(line)
    empty_key = nil

    line.each do |key|
      if @squares[key].unmarked?
        return nil if empty_key
        empty_key = key
      end
    end

    empty_key
  end

  def imminent_game_overs
    imminent_game_overs = {}

    WINNING_LINES.each do |line|
      empty_square = find_single_empty_square(line)
      next unless empty_square

      imminent_winning_marker = line_winning_marker(line - [empty_square])
      next unless imminent_winning_marker
      imminent_game_overs[imminent_winning_marker] = empty_square
    end

    imminent_game_overs
  end

  private

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                   [1, 4, 7], [2, 5, 8], [3, 6, 9],
                   [1, 5, 9], [3, 5, 7]]

  def line_winning_marker(line)
    winning_marker = @squares[line[0]].marker

    if winning_marker != Square::INITIAL_MARKER &&
       line.all? { |key| @squares[key].marker == winning_marker }
      winning_marker
    end
  end

  def draw_row(a, b, c)
    puts "     |     |"
    puts "  #{@squares[a]}  |  #{@squares[b]}  |  #{@squares[c]}"
    puts "     |     |"
  end

  def draw_line
    puts "-----|-----|------"
  end
end

class Square
  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def unmarked?
    @marker == INITIAL_MARKER
  end

  private

  INITIAL_MARKER = ' '

  def to_s
    @marker
  end
end

class Player
  attr_reader :marker, :score, :opponent_marker

  def initialize(marker, opponent_marker)
    @marker = marker
    @opponent_marker = opponent_marker
    reset_score
  end

  def increment_score
    @score += 1
  end

  def reset_score
    @score = 0
  end
end

class Human < Player
  include Inputable

  def mark(board)
    puts "Choose a square (#{join_or(board.unmarked_keys)}):"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = marker
  end
end

class Computer < Player

  # returns the minimum value of the board
  def max_value(board)
    # get a list of all empty squares on the board
    unmarked_keys = board.unmarked_keys.shuffle

    # create new boards for each of the empty squares with computer's marker in each empty square
    new_boards = unmarked_keys.map do |key|
      new_board = Board.copy(board)
      new_board[key] = marker
      new_board
    end

    # if any of these are a terminal board
    #   - return the associated value
    new_boards.each do |new_board|
      winning_marker = board.winning_marker
      if winning_marker == marker
        return 1
      elsif winning_marker == opponent_marker
        return -1
      elsif new_board.full?
        return 0
      end
    end

    # otherwise:
    #   - go through the list of boards, calling min_value
    #   - return the maximum value of the results
    values = new_boards.map { |new_board| min_value(new_board) }

    if values.include?(1)
      1
    else
      values.sum.to_f / values.length
    end
  end

  def min_value(board)
    # get a list of all empty squares on the board
    unmarked_keys = board.unmarked_keys.shuffle

    # create new boards for each of the empty squares with opponent's marker in each empty square
    new_boards = unmarked_keys.map do |key|
      new_board = Board.copy(board)
      new_board[key] = opponent_marker
      new_board
    end

    # if any of these are a terminal board
    #   - return the associated value
    new_boards.each do |new_board|
      winning_marker = new_board.winning_marker
      if winning_marker == marker
        return 1
      elsif winning_marker == opponent_marker
        return -1
      elsif new_board.full?
        return 0
      end
    end

    # otherwise:
    #   - go through the list of boards, calling max_value
    #   - return the minimum value of the results
    values = new_boards.map { |new_board| max_value(new_board) }

    if values.include?(-1)
      -1
    else
      values.sum.to_f / values.length
    end
  end

  def get_minimax_move(board)
    unmarked_keys = board.unmarked_keys.shuffle

    moves_and_boards = {}

    unmarked_keys.each do |key|
      new_board = Board.copy(board)
      new_board[key] = marker
      moves_and_boards[key] = new_board
    end

    moves_and_boards.each do |key, board|
      if board.winning_marker == marker
        return key
      end
    end

    moves_and_boards.max_by { |key, board| min_value(board) }[0]
  end

  def mark(board)
    move = get_minimax_move(board)
    # imminent_game_overs = board.imminent_game_overs

    # move = imminent_game_overs[marker]
    # move ||= imminent_game_overs.values[0]
    # move ||= regular_move(board)

    board[move] = marker
  end

  private

  def regular_move(board)
    move_options = board.unmarked_keys
    return 5 if move_options.include?(5)

    board.unmarked_keys.sample
  end
end

class TTTGame
  include Inputable

  def initialize
    @board = Board.new
  end

  def play
    display_welcome_message
    loop do
      set_up_tournament
      play_tournament
      display_tournament_result
      break unless play_another_tournament?
      clear_screen
    end
    display_goodbye_message
  end

  private

  P1_MARKER = 'X'
  P2_MARKER = 'O'

  attr_reader :board, :human, :computer, :current_player, :goal_score

  def clear_screen
    system('clear') || system('cls')
  end

  def set_up_tournament
    set_up_players
    set_up_new_game
    set_goal_score
    human.reset_score
    computer.reset_score
  end

  def set_up_players
    puts "Would you like to be 'X' (goes first) or 'O' (goes second)?"
    answer = user_input_choice(['x', 'o'])
    case answer
    when 'x' then make_players(P1_MARKER, P2_MARKER)
    when 'o' then make_players(P2_MARKER, P1_MARKER)
    end

    puts
  end

  def set_up_new_game
    board.clear
    reset_current_player
  end

  def make_players(human_marker, computer_marker)
    @human = Human.new(human_marker, computer_marker)
    @computer = Computer.new(computer_marker, human_marker)
    reset_current_player
  end

  def set_goal_score
    puts "How many wins should we play to? (1 - 5)"
    wins = user_input_integer((1..5))
    @goal_score = wins
  end

  def reset_current_player
    @current_player = (human.marker == P1_MARKER ? @human : @computer)
  end

  def play_tournament
    display_tournament_welcome

    loop do
      play_single_game
      display_game_result
      break if tournament_winner? || quit_tournament?
      set_up_new_game
      puts "Let's play again!"
      puts ""
    end
  end

  def tournament_winner?
    human.score == goal_score || computer.score == goal_score
  end

  def quit_tournament?
    puts "Press ENTER to continue"
    puts "'q' to quit the tournament."
    continue = gets.chomp
    continue.downcase == 'q'
  end

  def play_single_game
    clear_screen_and_display_board if human_turn?
    loop do
      current_player.mark(board)
      break if board.full? || board.someone_won?
      clear_screen_and_display_board
      toggle_player
      sleep 0.5 if human_turn?
    end
  end

  def toggle_player
    case current_player
    when computer then @current_player = human
    when human then @current_player = computer
    end
  end

  def human_turn?
    current_player == human
  end

  def play_another_tournament?
    puts "Would you like to play another Tic-Tac-Tournament? (y/n)"
    answer = user_input_choice(%w(y n yes no))
    answer[0] == 'y'
  end

  def clear_screen_and_display_board
    clear_screen
    display_board
  end

  def display_board
    puts "You are #{human.marker}. Computer is #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def display_tournament_welcome
    clear_screen
    puts "Starting the Tic-Tac-Tournament!!!"
    puts
    display_goal_score
    sleep 2
  end

  def display_goal_score
    puts "The first player with #{goal_score} wins the tournament."
  end

  def display_tournament_result
    if human.score == goal_score
      puts "Congrats! You are the first to #{goal_score} points!"
      puts "YOU WIN THE TOURNAMENT!"
    elsif computer.score == goal_score
      puts "The computer is the first to #{goal_score} points."
      puts "The computer won the tournament."
    end
    puts ""
  end

  def display_welcome_message
    clear_screen
    puts "***********************************"
    puts "***** Welcome to Tic Tac Toe! *****"
    puts "***********************************"
    puts
    sleep 1.5
  end

  def display_game_result
    clear_screen_and_display_board
    display_winner
    puts ""
    display_score
    display_goal_score unless tournament_winner?
    puts ""
  end

  def display_winner
    case board.winning_marker
    when human.marker
      puts "#{human.marker} won!"
      human.increment_score
    when computer.marker
      puts "#{computer.marker} won!"
      computer.increment_score
    else
      puts "The board is full. It's a tie!"
    end
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
    puts ""
  end

  def display_score
    puts "You have #{human.score} point#{human.score == 1 ? '' : 's'}."
    puts "The computer has #{computer.score} \
point#{computer.score == 1 ? '' : 's'}."
  end
end

game = TTTGame.new
game.play
