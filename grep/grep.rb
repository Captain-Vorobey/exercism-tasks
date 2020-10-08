require_relative('flags.rb')

class Grep
  def self.grep(pattern, flags, files)
    Flags.new.which_flag(files, flags, pattern)
  end
end

files = ['text.txt', 'text1.txt']
flags = []
pattern = 'hello'

Grep.grep(pattern, flags, files)
