class Teams
    attr_reader :captain
    attr_accessor :name, :players, :toss, :attack_1, :attack_2, :attack_3, :score, :defend_1, :defend_2, :defend_3, :extra
    def initialize(name, players, score, captain, toss, attack_1, attack_2, attack_3, defend_1, defend_2, defend_3, extra)
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
        @extra = extra
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