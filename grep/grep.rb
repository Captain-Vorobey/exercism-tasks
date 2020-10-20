require_relative('flags.rb')

class Grep < Flags
  def self.grep(pattern, flags, files)
    result = Flags.new(flags, files).grep(pattern).join.strip
  end
end

pattern = 'hello'
flags = ['-n', '-l']
files = ['text.txt', 'text1.txt']

p Grep.grep(pattern, flags, files)
