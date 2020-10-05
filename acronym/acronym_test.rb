
class Arguments
  def self.run(arg_v)
    for i in 0 ... arg_v.length
        puts "#{i} #{arg_v[i]}"
     end
  end
end

class Acronym

    def initialize(str)
        @str = str
    end

    def abbreviate
        @str.scan(/\w+/).join(" ").split.map(&:chr).join.upcase
    end
  end


acronym = Acronym.new("Ruby,@ On$ Rails")
p acronym.abbreviate