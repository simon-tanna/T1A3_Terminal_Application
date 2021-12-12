class Teams
    attr_reader :name, :players, :captain
    attr_accessor :toss, :attack_1, :attack_2, :attack_3, :score, :defend_1, :defend_2, :defend_3
    def initialize(name, players, score, captain, toss, attack_1, attack_2, attack_3, defend_1, defend_2, defend_3)
        @name = name
        @players = players
        @score = score
        @captain = captain
        @toss = toss
        @attack_1 = attack_1
        @attack_2 = attack_2
        @attack_3 = attack_3
        @defend_1 = defend_1
        @defend_2 = defend_2
        @defend_3 = defend_3
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