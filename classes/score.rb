class Score
    attr_reader :team
    attr_accessor :score

    def initialize(team, score)
        @team = team
        @score = score
    end

    def to_s
        "#{@team} - #{@score}"
    end
end
