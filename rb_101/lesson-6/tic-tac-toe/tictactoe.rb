require 'pry'

SCROLL = true
INITIAL_MARKER = ' '
P1_MARKER = 'X'
P2_MARKER = 'O'
TIE = "T"
PLAYERS = [P1_MARKER, P2_MARKER]
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diags
DIFFICULTY = { easy: 1, medium: 2, hard: 3, impossible: 4 }
PROMPT = "=> "
CENTER_SQ = 5

def prompt(msg)
  scroll_println(msg, prompt: PROMPT)
end

def display_welcome
  clear
  scroll_print "***** Welcome to Tic-Tac-Toe *****"
  puts
end

def scroll_println(message, timeout = 0.025, prompt: '')
  timeout = 0 if !SCROLL
  scroll_print(message, timeout, prompt: prompt)
  puts
end

def scroll_print(message, timeout = 0.025, prompt: '')
  timeout = 0 if !SCROLL
  message = prompt + message
  message.chars.each do |char|
    print char
    sleep(timeout)
  end
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  puts ""
  puts "      |     |"
  puts "   #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     1|    2|    3"
  puts " -----+-----+-----"
  puts "      |     |"
  puts "   #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     4|    5|    6"
  puts " -----+-----+-----"
  puts "      |     |"
  puts "   #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     7|    8|    9"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def clear
  system('clear') || system('cls')
end

def joinor(list, delim = ',', final = 'or')
  if list.size == 1
    return list[0].to_s
  elsif list.size == 2
    return "#{list[0]} #{final} #{list[1]}"
  end

  "#{list[0..-2].join(delim + ' ')}#{delim} #{final} #{list[-1]}"
end

def valid_int_input?(input)
  input.to_i.to_s == input
end

def input_difficulty_level
  choice = 0
  prompt "Please choose a difficulty level:"
  scroll_println "  1 - Easy"
  scroll_println "  2 - Medium"
  scroll_println "  3 - Hard"
  scroll_println "  4 - Impossible"
  loop do
    scroll_print("", prompt: PROMPT)
    choice = gets.chomp
    break if valid_int_input?(choice) &&
             (DIFFICULTY[:easy]..DIFFICULTY[:impossible]).cover?(choice.to_i)
    prompt "Invalid choice, please try again."
  end

  choice.to_i
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| empty?(brd, num) }
end

def marker(player_name, players)
  players.key(player_name)
end

def other_marker(marker)
  (PLAYERS - [marker])[0]
end

def next_turn(brd)
  board_balance = brd.values.count(P1_MARKER) - brd.values.count(P2_MARKER)
  board_balance > 0 ? P2_MARKER : P1_MARKER
end

def empty?(brd, position)
  brd[position] == INITIAL_MARKER
end

def board_full(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    line_values = brd.values_at(*line)

    if line_values.all? { |value| value == P1_MARKER }
      return P1_MARKER
    elsif line_values.all? { |value| value == P2_MARKER }
      return P2_MARKER
    end
  end

  nil
end

def make_next_move!(brd, difficulty, players)
  next_player = next_turn(brd)

  case players[next_player]
  when 'Player'   then player_places_marker!(brd, marker('Player', players))
  when 'Computer' then computer_places_marker!(brd,
                                               difficulty,
                                               marker('Computer', players))
  end
end

def place_marker!(brd, marker, position)
  brd[position] = marker
end

def player_places_marker!(brd, marker)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    scroll_print("", prompt: PROMPT)
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)

    prompt "Sorry, that's not a valid choice."
  end

  place_marker!(brd, marker, square)
end

def find_imminent_win_position(brd, marker)
  WINNING_LINES.each do |line|
    values = brd.values_at(*line)
    if values.count(marker) == 2 && values.count(INITIAL_MARKER) == 1
      return line[values.index(INITIAL_MARKER)]
    end
  end

  nil
end

def make_winning_move!(brd, marker)
  position = find_imminent_win_position(brd, marker)
  if position
    place_marker!(brd, marker, position)
    return true
  end

  nil
end

def make_defensive_move!(brd, marker)
  position = find_imminent_win_position(brd, other_marker(marker))
  if position
    place_marker!(brd, marker, position)
    return true
  end

  nil
end

def next_moves(brd)
  next_moves = []
  marker = next_turn(brd)
  empty_squares(brd).each do |square|
    new_board = new_board(brd, marker, square)
    next_moves << { position: square, board: new_board }
  end
  next_moves
end

def new_board(brd, marker, move)
  new_brd = brd.dup
  place_marker!(new_brd, marker, move)
  new_brd
end

def winner_or_tie_result(moves)
  moves.each do |move|
    winner = detect_winner(move[:board])
    return winner if winner
  end

  moves.each do |move|
    return TIE if board_full(move[:board])
  end

  nil
end

def move_result(brd)
  next_moves = next_moves(brd)
  marker = next_turn(brd)
  win_or_tie_result = winner_or_tie_result(next_moves)

  return win_or_tie_result if win_or_tie_result

  next_results = next_moves.map { |move| move_result(move[:board]) }

  next_results.max do |result1, result2|
    result_to_value(result1, marker) <=> result_to_value(result2, marker)
  end
end

def result_to_value(result, desired_marker)
  case result
  when desired_marker then 1
  when TIE then 0
  else -1
  end
end

def evaluate_moves(moves, marker)
  moves.each do |move|
    result = move_result(move[:board])
    move[:value] = result_to_value(result, marker)
  end
end

def select_best_moves(moves)
  max_move = moves.max { |move1, move2| move1[:value] <=> move2[:value] }
  moves.select { |move| move[:value] == max_move[:value] }
end

def prune_winning_move(moves)
  moves.each do |move|
    if someone_won?(move)
      return move
    end
  end

  nil
end

def make_minimax_move!(brd, marker)
  next_moves = next_moves(brd)
  winning_move = prune_winning_move(next_moves)

  if winning_move
    place_marker!(winning_move[:board], marker, winning_move[:position])
    return
  end

  evaluate_moves(next_moves, marker)
  best_move = select_best_moves(next_moves).sample
  place_marker!(brd, marker, best_move[:position])

  true
end

def mark_center_square!(brd, marker)
  if empty?(brd, CENTER_SQ)
    place_marker!(brd, marker, CENTER_SQ)
    return true
  end

  nil
end

def make_random_move!(brd, marker)
  move = empty_squares(brd).sample
  place_marker!(brd, marker, move)
  true
end

def computer_places_marker!(brd, diff_level, marker)
  if diff_level == DIFFICULTY[:impossible]
    puts " Computer is thinking..."
    make_minimax_move!(brd, marker)
    return
  end

  if diff_level >= DIFFICULTY[:medium]
    return if make_defensive_move!(brd, marker)
  end

  if diff_level >= DIFFICULTY[:hard]
    return if make_winning_move!(brd, marker)
  end

  return if mark_center_square!(brd, marker)

  make_random_move!(brd, marker)
end

def update_score!(score, players, winner)
  if winner
    score[players[winner]] += 1
  else
    score["Tie"] += 1
  end
end

def display_score(score)
  prompt "You: #{score['Player']}, Computer: #{score['Computer']}"
end

def input_play_again
  puts
  answer = 0
  loop do
    prompt "Choose an option:"
    scroll_println "   1) Play again with same settings"
    scroll_println "   2) Change settings and play again"
    scroll_println "   3) Quit"
    scroll_print "=> "
    answer = gets.chomp
    break if (1..3).cover?(answer.to_i) && valid_int_input?(answer)
    prompt "Invalid choice, please try again."
  end

  answer.to_i
end

def input_players
  puts
  prompt "Which player would you like to be? #{joinor(PLAYERS)}?"
  scroll_print("", prompt: "=> ")
  user_choice = ''
  loop do
    user_choice = gets.chomp.upcase
    break if PLAYERS.include?(user_choice)
    prompt "Invalid entry. Please, try again."
  end
  computer_choice = PLAYERS.find { |player| player != user_choice }
  { computer_choice => 'Computer', user_choice => 'Player' }
end

def display_players(players)
  clear
  puts "You are #{marker('Player', players)}. \
Computer is #{marker('Computer', players)}."
end

def display_result(result, players)
  if PLAYERS.include?(result)
    if players[result] == 'Player'
      prompt "You won!"
    else
      prompt "The computer won!"
    end
  else
    prompt "It's a tie!"
  end
end

def display_easter_egg
  sleep 0.5
  puts
  prompt "A strange game."
  prompt "The only winning move is not to play."
  puts
  sleep 0.5
end

def display_goodbye
  scroll_println "Thanks for playing Tic-Tac-Toe. Goodbye!"
  puts
  sleep 0.5
end

# Main Loop
score = { "Computer" => 0, "Player" => 0, "Tie" => 0 }
display_welcome

loop do
  play_again_ans = 0
  diff_level = input_difficulty_level
  players = input_players

  loop do
    board = initialize_board
    loop do
      display_players(players)
      display_board(board)
      make_next_move!(board, diff_level, players)
      break if someone_won?(board) || board_full(board)
    end

    display_players(players)
    display_board(board)
    winner = detect_winner(board)
    display_result(winner, players)
    display_easter_egg if score[:tie] == 5

    update_score!(score, players, winner)
    display_score(score)

    play_again_ans = input_play_again

    break unless play_again_ans == 1
  end

  clear
  break unless play_again_ans == 2
end

display_goodbye
