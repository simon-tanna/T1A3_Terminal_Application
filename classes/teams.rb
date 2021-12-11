class Teams
    attr_reader :name, :players, :score, :captain
    def initialize(name, players, score, captain)
        @name = name
        @players = players
        @score = score
        @captain = captain
    end

    def to_s
        "#{@captain}'s #{@name}"
    end

    def all_team_info
        puts "Team Name: #{@captain}'s #{@name}"
        puts "Team Captain: #{@captain}"
        puts "Players:"
        @players.each {|player| player}
    end
end