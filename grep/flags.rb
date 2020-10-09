require 'io/console'

class Flags
  def initialize
    @result = []
    @files = []
    @all_result = []
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
        @result.push(string) if !string.match(/#{pattern}/)
      end
    end
    @result
  end

  def l_flag(files, pattern)
    files.each do |file|
      IO.readlines(file).each do |string|
        if string.match(/#{pattern}/)
          @files.push(file)
          break
        end
      end
    end
    @files
  end

  def i_flag(files, pattern)
    arr = no_flags(files, pattern)
    down_case_rows(arr, files, pattern)
  end

  def x_flag(files, pattern)
    files.each do |file|
      IO.readlines(file).each do |string|
        if string.match(/^#{pattern}$/)
          @result.push(string)
        end 
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
  # ['-n', '-l', '-i', '-v', '-x']
  def flags(files, flags, pattern)
    if flags.any? == false
      @all_result = no_flags(files, pattern)
    end
    flags.each do |flag|
      if flag == '-n'
        @all_result = n_flag(files, pattern)
      end

      if flag == '-l'
        return l_flag(files, pattern)
      end

      if flag == '-i'
        @all_result = i_flag(files, pattern)
      end

      if flag == '-v'
        @all_result = v_flag(files, pattern)
      end

      if flag == '-x'
        @all_result = x_flag(files, pattern)
      end
    end
    @all_result
  end
end
