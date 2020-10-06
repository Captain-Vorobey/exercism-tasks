=begin
Write your code for the 'Queen Attack' exercise in this file. Make the tests in
`queen_attack_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/queen-attack` directory.
=end

class Queens
    def initialize(white: [], black: [])
      @white = white
      @black = black
      check_queens_error
    end

    def is_attack?
        row? || col? || diagonal?
    end

    def row?
        @white[0] == @black[0]
    end

    def col?
        @white[1] == @black[1]
    end

    def diagonal?
        (@white[0] - @black[0]).abs == (@white[1] - @black[1]).abs
    end

    def check_queens_error
        raise ArgumentError if @white[0] < 0 || @white[0] > 7 || @white[1] < 0 || @white[1] > 7 
        raise ArgumentError if @black[0] < 0 || @black[0] > 7 || @black[1] < 0 || @black[1] > 7
    end
  end

res = Queens.new(white: [2, 4], black: [2, 6]).is_attack?
p res
