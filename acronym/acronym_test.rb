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