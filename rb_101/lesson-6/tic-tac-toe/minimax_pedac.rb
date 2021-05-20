  # Recursively evaluates all possible moves to arrive the optimal solution for
  # the given player. P1 is max (1) , P2 is min (-1), tie is 0
  #
  # Data:
  # - next_moves is an array of hashes with the info about each next move:
  # -  - { move: (the location of move made), board: the resulting board, val: (the resulting value) }
  #
  # Alg:
  # - Get list of empty squares and store in array emtpy_squares
  # - FOR each empty_square:
  #   - Board = get the board that results from making the move
  #   - If that board is a winner, make that move immediately
  #   - Otherwise, add to next_moves { move: current_square, board: board }
  #
  # If marker is P1
  #  - For each next_move:
  #    - Store the minimum value of that board in hash by passing the board to min_value
  #  - Find the move with the max value
  #  - Make that move
  # If marker is P2
  #  - For each next_move:
  #    - Store the max value of that board in hash by passing the board to max_value
  #    - Find the move with the minimum value
  #    - Make that move
  
