require 'pry'

class Board
  def draw
    draw_row(1, 2, 3)
    draw_line
    draw_row(4, 5, 6)
    draw_line
    draw_row(7, 8, 9)
  end

  def reset
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

  def imminent_game_over(marker, comparison)
    WINNING_LINES.each do |line|
      empty_key = find_single_empty_square(line)
      next unless empty_key

      imminent_winning_marker = line_winning_marker(line - [empty_key])
      return empty_key if imminent_winning_marker&.send(comparison, marker)
    end

    nil
  end

  def winning_move(marker)
    imminent_game_over(marker, :==)
  end

  def blocking_move(marker)
    imminent_game_over(marker, :!=)
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

  private

  ROWS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  COLS = [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
  DIAGS = [[1, 5, 9], [3, 5, 7]]
  WINNING_LINES = ROWS + COLS + DIAGS

  def initialize
    @squares = {}
    reset
  end

  def join_or(list, delim: ',', final: 'or')
    return list[0].to_s if list.size == 1
    return "#{list[0]} #{final} #{list[1]}" if list.size == 2
    "#{list[0..-2].join(delim + ' ')}#{delim} #{final} #{list[-1]}"
  end

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

  def unmarked?
    @marker == INITIAL_MARKER
  end

  private

  INITIAL_MARKER = ' '

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end
end

class Player
  attr_reader :marker, :score

  def increment_score
    @score += 1
  end

  def reset_score
    @score = 0
  end

  def initialize(marker)
    @marker = marker
    reset_score
  end
end

class Human < Player
  def mark(board)
    puts "Choose a square (#{board.list_unmarked_keys}):"
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
  def mark(board)
    move = board.winning_move(marker)
    move ||= board.blocking_move(marker)
    move ||= regular_move(board)

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
  def play
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  GOAL_SCORE = 1

  attr_reader :board, :human, :computer, :current_player

  def initialize
    @board = Board.new
    @human = Human.new(HUMAN_MARKER)
    @computer = Computer.new(COMPUTER_MARKER)
    @current_player = human
  end

  def clear
    system('clear') || system('cls')
  end

  def main_game
    loop do
      puts "The first player to #{GOAL_SCORE} wins!"

      play_tournament

      display_tournament_result
      break unless play_again?
      reset_tournament
    end
  end

  def play_tournament
    loop do
      display_board
      players_take_turns
      display_result
      break if human.score == GOAL_SCORE || computer.score == GOAL_SCORE
      break unless continue?
      reset
    end
  end

  def reset_tournament
    human.reset_score
    computer.reset_score
    reset
    puts "Let's play again!"
    puts ""
  end

  def continue?
    puts "Press ENTER to continue or 'q' to quit this tournament."
    continue = gets.chomp
    continue.downcase != 'q'
  end

  def display_tournament_result
    if human.score == GOAL_SCORE
      puts "Congrats! You are the first to #{GOAL_SCORE} points!"
      puts "YOU WIN THE TOURNAMENT!"
    elsif computer.score == GOAL_SCORE
      puts "The computer is the first to #{GOAL_SCORE} points."
      puts "The computer won the tournament."
    end
    puts ""
  end

  def players_take_turns
    loop do
      current_player.mark(board)
      break if board.full? || board.someone_won?
      toggle_player
      clear_screen_and_display_board if human_turn?
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

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play another tournament? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n yes no).include? answer
      puts "Sorry, anwer must be y or n."
    end

    answer[0] == 'y'
  end

  def reset
    board.reset
    clear
    reset_current_player
  end

  def reset_current_player
    @current_player = human
  end

  def display_welcome_message
    clear
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_result
    clear_screen_and_display_board
    display_winner
    puts ""
    display_score
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

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_board
    puts "You are #{human.marker}. Computer is #{computer.marker}."
    puts ""
    board.draw
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