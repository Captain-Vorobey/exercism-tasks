=begin
Write your code for the 'Matrix' exercise in this file. Make the tests in
`matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matrix` directory.
=end

class Matrix
    attr_reader :rows, :columns
  
    def initialize(matrix)
      @rows = matrix.split("\n").map{|row| row.split.map(&:to_i)}
      @columns = rows.transpose
    end
  end

  matrix = Matrix.new("1 4 9\n16 25 36\n163 252 361")
  p matrix
