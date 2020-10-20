require 'io/console'

class Flags
  def initialize(flags)
    @result = []
    @flags = flags
  end

  def grep(str, files)
    pattern = create_pattern(str)
    p pattern
    @flags.include?('-v') ? v_flag(files, pattern) : f(files, pattern)
    @result
  end

  private

  def f(files, pattern)
    files.each do |file|
      IO.readlines(file).each_with_index do |string, index|
        @result.push(check_flags(file, string, index)) if string.match(pattern)
      end
    end
  end

  def v_flag(files, pattern)
    files.each do |file|
      IO.readlines(file).each_with_index do |string, index|
        @result.push(check_flags(file, string, index)) unless string.match(pattern)
      end
    end
  end

  def check_flags(file, string, index)
    n = @flags.include?('-n') ? "#{index + 1}:" : ''
    l = @flags.include?('-l') ? "#{file}:" : ''
    "#{l}#{n}#{string}"
  end

  def create_pattern(str)
    i = @flags.include?('-i') ? Regexp::IGNORECASE : false
    x = @flags.include?('-x') ? Regexp::MULTILINE : false
    pattern = Regexp.new(str.to_s, i || x)
  end
end
