class BotTeams
    attr_reader :captain, :name, :players
    attr_accessor   :score
    def initialize(name, players, score, captain)
        @name = name
        @players = players
        @score = score
        @captain = captain
    end

    def to_s
        "The #{@captain} #{@name}"
    end

    def all_team_info
        puts "Team Name: The #{@captain} #{@name}"
        puts "Team Captain: #{@captain}"
        puts "Players:"
        @players.each {|player| player}
    end
end