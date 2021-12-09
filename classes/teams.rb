class Teams
    attr_accessor :name, :players, :score
    def initialize(name, players, score)
        @name = name
        @players = players
        @score = score
    end

    def to_s
        "Team: #{@name} Players: #{@players} Score: #{@score}"
    end
end