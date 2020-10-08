# Write your code for the 'Minesweeper' exercise in this file. Make the tests in
# `minesweeper_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/minesweeper` directory.

class Board
  def self.transform(input)
    @t = input.map { |el| el.split('') }

    @t.each_with_index do |r, r_in|
      r.each_with_index do |c, c_in|
        insert_one(r_in, c_in) if mine?(c)
      end
    end
    @t.map { |el| el.join('') }
  end

  def self.mine?(c)
    c.include?('*')
  end

  def self.digit?(ch)
    ch.match(/[1-8 ]/) ? (ch.to_i + 1).to_s : ch
  end

  def self.insert_one(r, c)
    (r - 1..r + 1).each do |i|
      (c - 1..c + 1).each do |j|
        @t[i][j] = digit?(@t[i][j])
      end
    end
  end
end
