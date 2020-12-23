=begin
PROBLEM:
- IN/OUT: 3x3 array -> 3x3 array (nested)
- Transpose a 3x3 matrix 
- col 1 becomes row 1, col 2 -> row 2 and so on
- creates a new matrix
- does not mutate original

- arr[0][0] -> new_arr[0][0]
- arr[0][1] -> new_arr[1][0]
- etc:
- arr[i][j] -> new_arr[j][i]
- new_arr[j][i] = arr[i][j]

DATA: arrays!

ALG:
- set new_array = []
- using index from 0 to 2 as 'j'
  - set temp_array = []
  - using index from 0 to 2 as 'i'
    - temp_array[i] = array[i][j]
  - new_array << temp_array.dup
- return new_array
=end

def transpose(matrix)
  new_array = []
  0.upto(2) do |j|
    temp_array = []
    0.upto(2) do |i|
      temp_array[i] = matrix[i][j]
    end
    new_array << temp_array.dup
  end

  new_array
end

=begin

1 2 3   1 4 7  1 4 7  1 4 7
4 5 6   2      2 5 8  2 5 8
7 8 9   3      3 6    3 6 9


=end

def transpose!(matrix)
  0.upto(2) do |i|
    i.upto(2) do |j|
      matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
    end
  end
  matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

transpose!(matrix)
p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
