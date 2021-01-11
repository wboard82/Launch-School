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

  def join_or(list, delim: ',', final: 'or')
    if list.size == 1
      return list[0].to_s
    elsif list.size == 2
      return "#{list[0]} #{final} #{list[1]}"
    end

    "#{list[0..-2].join(delim + ' ')}#{delim} #{final} #{list[-1]}"
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      winner = line_winner(line)
      return winner if winner
    end

    nil
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

  def line_winner(line)
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

  def initialize(marker)
    @marker = marker
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
    board[board.unmarked_keys.sample] = marker
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

  attr_reader :board, :human, :computer, :current_player

  def initialize
    @board = Board.new
    @human = Human.new(HUMAN_MARKER)
    @computer = Computer.new(COMPUTER_MARKER)
    @current_player = :human
  end

  def clear
    system('clear') || system('cls')
  end

  def main_game
    loop do
      display_board
      player_move

      clear_screen_and_display_board
      display_result
      break unless play_again?
      reset
    end
  end

  def player_move
    loop do
      current_player_moves
      break if board.full? || board.someone_won?
      clear_screen_and_display_board if human_turn?
    end
  end

  def human_moves
    human.mark(board)
  end

  def computer_moves
    computer.mark(board)
  end

  def current_player_moves
    case current_player
    when :human then human_moves
    when :computer then computer_moves
    end

    toggle_player
  end

  def toggle_player
    case current_player
    when :computer then @current_player = :human
    when :human then @current_player = :computer
    end
  end

  def human_turn?
    current_player == :human
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n yes no).include? answer
      puts "Sorry, anwer must be y or n."
    end

    answer[0] == 'y'
  end

  def reset
    board.reset
    clear
    puts "Let's play again!"
    puts ""
    reset_current_player
  end

  def reset_current_player
    @current_player = :human
  end

  def display_welcome_message
    clear
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when HUMAN_MARKER
      puts "#{human.marker} won!"
    when COMPUTER_MARKER
      puts "#{computer.marker} won!"
    else
      puts "The board is full. It's a tie!"
    end
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
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
end

game = TTTGame.new
game.play
