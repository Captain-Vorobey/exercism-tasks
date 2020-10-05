=begin
Write your code for the 'Meetup' exercise in this file. Make the tests in
`meetup_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/meetup` directory.
=end

require 'date'

WEEKDAYS = [:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday]
ORDINALS = [:first, :second, :third, :fourth, :fifth] 

class Meetup

    def initialize(month, year)
      @month = month
      @year = year
    end
  
    def day(weekday, which)
      matches = (1..Date.new(@year, @month, -1).day).select{ |d| Date.new(@year, @month, d).wday == WEEKDAYS.index(weekday) }
      if which == :last
        day = matches[-1]
      elsif which == :teenth
        day = matches.find{ |d| d > 12 }
      else
        day = matches[ORDINALS.index(which)]
      end
     	 Date.new(@year, @month, day) 
    end
  end

  Meetup.new(4, 2013).day(:sunday, :last)
