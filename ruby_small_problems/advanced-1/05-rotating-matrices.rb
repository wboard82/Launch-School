=begin
PROBLEM: Rotate an MxN matrix 90 degrees to the right

00 01 --> 00
          01

00 01   ->  10 00
10 11   ->  11 01

- each row (row_idx) becomes a column (last_column - row_idx)
- EXAMPLE:
1 2 3
4 5 6 
7 8 9

last_column = matrix.size - 1

ALGORITHM:
- create new_array that is N x M in size
- iterate through each row (with row_index) of matrix:
  - for each element (with elem_index) in the row:
    - put it in the new array at position elem_index, last_column - row_index)

- return new_array
=end

def rotate90(matrix)
  new_matrix = Array.new(matrix[0].size) { Array.new(matrix.size) }
  last_col = matrix.size - 1

  matrix.each_with_index do |row, row_idx|
    row.each_with_index do |elem, elem_idx|
      new_matrix[elem_idx][last_col - row_idx] = elem
    end
  end

  new_matrix
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2
