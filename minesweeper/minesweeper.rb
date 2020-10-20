# Write your code for the 'Minesweeper' exercise in this file. Make the tests in
# `minesweeper_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/minesweeper` directory.

class Board
  def self.transform(input)
      @t = input
      validate_input        
      @t = input.map { |el| el.split('') }
      @t.each_with_index do |r, r_in| 
          r.each_with_index do |c, c_in| 
              if mine?(c) 
                  insert_one(r_in, c_in)
              end    
          end
      end
      @t.map { |el| el.join('') }
  end

  private

  def self.validate_input
  if !@t.all? { |line| line.length == @t[0].length }
    return raise ArgumentError.new('Lines must be equal length')
  elsif [@t.first, @t.last].any? { |line| line.match?('/[^\-\+]/') }
    return raise ArgumentError.new('Top and bottom borders must only use + and - characters')
  elsif @t[1..-2].any? { |line| line[0] != '|' || line[-1] != '|' }
    return raise ArgumentError.new('Side borders must only use | character')
  elsif @t[1..-2].any? { |line| line[1..-2].match?('[^\*\s]')}
    return raise ArgumentError.new('Board should only include blank spaces and asterisks')
  end
end

  def self.mine?(c)
      c.include?('*')
  end

  def self.digit(ch)
      ch.match(/[1-8 ]/) ? "#{ch.to_i + 1}" : ch
  end

  def self.insert_one(r, c)
      (r-1..r+1).each { |i|
          (c-1..c+1).each { |j|
              @t[i][j] = digit(@t[i][j])
          }
      }
  end
end



p Board.transform([
  '+-----+',
  '| * * |',
  '|  *  |',
  '+-----+'
])