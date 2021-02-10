=begin
The diamond exercise takes as its input a letter, and outputs it in a diamond shape.
Given a letter, it prints a diamond starting with 'A',
with the supplied letter at the widest point.

The first row contains one 'A'.
The last row contains one 'A'.
All rows, except the first and last, have exactly two identical letters.
The diamond is horizontally symmetric.
The diamond is vertically symmetric.
The diamond has a square shape (width equals height).
The letters form a diamond shape.
The top half has the letters in ascending order.
The bottom half has the letters in descending order.
The four corners (containing the spaces) are triangles.

A

- Always have an A first
- Width is determined by goal letter of the alphabet.
- A = 1, B = 3, C = 5
- 0 = 1, 1 = 3, 2 = 5, 3 = 7, 2(N) + 1
- WIDTH = 2N + 1
- Center spaces are determined by current_letter:
- A = N/A, B = 1, C = 3, D = 5
- 0 = -1, 1 = 1, 2 = 3, 3 = 5, 4 = 7, 5 = 9,
- 0 - 1 , 1 - 0, 2 + 1, 3 + 2, 4 + 3, 5 + 4, N + N - 1
- Center spaces are 2N - 1

=end

class Diamond
  LETTERS = [*('A'..'Z')]

  def self.make_diamond(letter)
    width = (2 * LETTERS.index(letter)) + 1
    letter_range = [*("A"...letter)] + [*("A"..letter)].reverse

    letter_range.map do |letter| { make_line(letter, width) }.join
  end

  def self.make_line(letter, width)
    return "A".center(width) + "\n" if letter == "A"

    num_spaces = 2 * LETTERS.index(letter) - 1
    result = letter + (' ' * num_spaces) + letter
    result.center(width) + "\n"
  end
end

