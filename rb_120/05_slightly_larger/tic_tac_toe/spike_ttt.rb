require 'pry'

class Board
  ROWS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  COLS = [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
  DIAGS = [[1, 5, 9], [3, 5, 7]]
  WINNING_LINES = ROWS + COLS + DIAGS

  def initialize
    @squares = { }
    reset
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def get_square_at(square)
    @squares[square]
  end

  def [](sqaure)
    @squares[sqaure]
  end

  def set_square_at(square, marker)
    @squares[square].marker = marker
  end

  def unmarked_keys
    @squares.keys.filter { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!detect_winner
  end

  def line_winner(line)
    winning_marker = @squares[line[0]].marker

    if winning_marker != Square::INITIAL_MARKER &&
        line.all? { |key| @squares[key].marker == winning_marker }
      winning_marker
    else
      nil
    end
  end

  def detect_winner
    WINNING_LINES.each do |line|
      winner = line_winner(line)
      return winner if winner
    end

    nil
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    @marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def human_moves
    puts "Choose a square (#{board.unmarked_keys.join(', ')}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board.set_square_at(square, human.marker)
  end

  def computer_moves
    board.set_square_at(board.unmarked_keys.sample, computer.marker)
  end

  def play
    system('clear')
    display_welcome_message

    loop do
      display_board(false)

      loop do
        human_moves
        break if board.full? || board.someone_won?

        computer_moves
        display_board
        break if board.full? || board.someone_won?
      end

      display_board
      display_result
      break unless play_again?
      board.reset
      system('clear')
      puts "Let's play again!"
      puts ""
    end
    display_goodbye_message
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

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_result
    display_board

    case board.detect_winner
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

  def display_board(clear = true)
    system('clear') if clear
    puts "You are #{human.marker}. Computer is #{computer.marker}."
    puts ""
    puts "     |     |"
    puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
    puts "     |     |"
    puts "-----|-----|------"
    puts "     |     |"
    puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
    puts "     |     |"
    puts "-----|-----|------"
    puts "     |     |"
    puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
    puts "     |     |"
    puts ""
  end
end

game = TTTGame.new
game.play
