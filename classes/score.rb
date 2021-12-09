class Score
    attr_reader :score, :team

    def initialize(team, score)
        @team = team
        @score = score
    end

    def to_s
        "#{@team} - #{@score}"
    end
    # def team
    # end
    
    # def score
    #     return @score
    # end
end
