
class Arguments
  def self.run(arg_v)
    for i in 0 ... arg_v.length
        puts "#{i} #{arg_v[i]}"
     end
  end
end

class Acronym
    def abbreviate
        ARGV[0].split("-").join(" ").split.map(&:chr).join.upcase
    end
  end


aronym = Acronym.new
ARGV = aronym.abbreviate
Arguments.run(ARGV)