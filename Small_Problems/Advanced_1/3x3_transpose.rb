# Understand the Problem
=begin
  write a method that takes a 3 x 3 matrix in an Array of Arrays format and returns the transpose of the original matrix.
  - input: a 3 x 3 matrix in array of arrays format
  - output: a new 3 x 3 matrix in array of arrays format
  - explicit rules:
    - must return a new object and not modify the original
    - must have an array of arrays format
  - implicit rules:
    - tranpose means the column location and row location switch places
      - [row], [column] = [column], [row]
  
=end

# Examples / Test Cases
=begin
  matrix = [         [
  [1, 5, 8],          [1, 4, 3]
  [4, 7, 2],    =>    [5, 7, 9]
  [3, 9, 6]           [8, 2, 6]
]                    ]
=end

# Data Structure
  # an Array of Arrays

# Algorithm
=begin
  - initialize trans_matrix as [[], [], []]
  - for each row_index of matrix 
    - for each column_index of matrix
      - trans_matrix[row_index] << matrix[column_index][row_index]
  - trans_matrix
=end

def transpose(matrix)
  trans_mat = [[], [], []]
  matrix.each.with_index do |row, row_index|
    row.each_index do |column_index|
      trans_mat[row_index] << matrix[column_index][row_index]
    end
  end
  trans_mat
end


matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)
p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]