=begin
Write your code for the 'Minesweeper' exercise in this file. Make the tests in
`minesweeper_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/minesweeper` directory.
=end

class Board
    def self.transform(input)
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

    def self.mine?(c)
        c.include?('*')
    end

    def self.digit?(ch)
        ch.match(/[1-8 ]/) ? "#{ch.to_i + 1}" : ch
    end

    def self.insert_one(r, c)
        (r-1..r+1).each { |i|
            (c-1..c+1).each { |j|
                @t[i][j] = digit?(@t[i][j])
            }
        }
    end
end

