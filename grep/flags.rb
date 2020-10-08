require 'io/console'

class Flags
  def initialize
    @result = []
  end

  def down_case_rows(rows, files, pattern)
    files.each do |file|
      IO.readlines(file).each_with_index do |row, _index|
        rows.push(row.downcase) if row.downcase.match(/#{pattern.downcase}/)
      end
    end
    rows
  end

  def no_flags(files, pattern)
    files.each do |file|
      IO.readlines(file).each do |string|
        @result.push(string) if string.match(/#{pattern}/)
      end
    end
    @result
  end

  def v_flag(files, pattern)
    files.each do |file|
      IO.readlines(file).each do |string|
        @result.push(string) if string.match(/#{pattern}/)
      end
    end
    @result
  end

  def l_flag(files, pattern)
    files.each do |file|
      IO.readlines(file).each do |string|
        if string.match(/#{pattern}/)
          @result.push(file)
          break
        end
      end
    end
    @result
  end

  def i_flag(files, pattern)
    arr = no_flags(files, pattern)
    down_case_rows(arr, files, pattern)
  end

  def x_flag(files, pattern)
    files.each do |file|
      IO.readlines(file).each do |string|
        @result.push(file) if string == /#{pattern}/
      end
    end
    @result
  end

  def n_flag(files, pattern)
    files.each do |file|
      IO.readlines(file).each_with_index do |string, index|
        @result.push(index) if string.match(/#{pattern}/)
      end
    end
    @result
  end

  def which_flag(files, flags, pattern)
    case flags[0]

    when '-l'
      p l_flag(files, pattern)
    when '-i'
      p @result.push(i_flag(files, pattern))
    when '-n'
      p n_flag(files, pattern)
    when '-v'
      p v_flag(files, pattern)
    else
      no_flags(files, pattern)
    end
  end
end
