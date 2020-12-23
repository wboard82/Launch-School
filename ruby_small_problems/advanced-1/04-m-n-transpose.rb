=begin
PROBLEM:
- transpose M x N matrix
- the size of the first sub-array will be the number of arrays in the new matrix
- the size of the outer array will be the size of the subarrays

DATA: arrays!

ALG:
- given 'arr' of size M x N
- set new_array to an empty array N x M
- iterate through each row of 'arr'
  - iterate through each elem of that 'row'
    - put arr[row][elem] into new_array[elem][row]

- return new_array
=end

def transpose(matrix)
  new_array = Array.new(matrix[0].size) { Array.new(matrix.size) }

  matrix.each_with_index do |row, row_idx|
    row.each_with_index do |elem, col_idx|
      new_array[col_idx][row_idx] = elem
    end
  end

  new_array

end


p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]


=begin

00 01 02
10 11 12

00 10
01 11
02 12

=end

def transpose!(matrix)
  0.upto(2) do |i|
    i.upto(2) do |j|
      matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
    end
  end
  matrix
end
