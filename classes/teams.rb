class Teams
    # attr_accessor :name, :player1, :player2, :player3, :player4, :player5, :score
    # def initialize(name, player1, player2, player3, player4, player5, score)
    #     @name = name
    #     @player1 = player1
    #     @player2 = player2
    #     @player3 = player3
    #     @player4 = player4
    #     @player5 = player5
    #     @score = score
    # end
    attr_reader :name, :players, :score
    def initialize(name, players, score)
        @name = name
        @players = players
        @score = score
    end

    def to_s
        "Team: #{@name} Players: #{@players} Score: #{@score}"
    end
end