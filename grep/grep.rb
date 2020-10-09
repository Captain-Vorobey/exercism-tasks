require_relative('flags.rb')

class Grep < Flags
  def self.grep(pattern, flags, files)
    Flags.new.flags(files, flags, pattern)
  end
end

files = ['text.txt', 'text1.txt']
flags = ['-x', '-v']
p flags.any?
pattern = 'hello'

p Grep.grep(pattern, flags, files)