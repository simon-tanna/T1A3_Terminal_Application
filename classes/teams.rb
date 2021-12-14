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

    # def create_user_team (name, players, score, captain, toss, attack_1, attack_2, attack_3, defend_1, defend_2, defend_3, extra)
    #     team_name = ""
    #     captain = ""
    #     team_new_players = []
    #     team_new_toss = ["heads", "tails"].sample
    #     team_attack_1 = ["pass", "shoot"].sample
    #     team_attack_2 = ["dribble then shoot", "shoot from range"].sample
    #     team_attack_3 = ["pass", "shoot"].sample
    #     team_defend_1 = ["slide tackle", "block tackle"].sample
    #     team_defend_2 = ["slide tackle", "block tackle"].sample
    #     team_defend_3 = ["slide tackle", "block tackle"].sample
    #     team_extra = ["shoot left", "shoot right"].sample
    #     choice_1 = Player.new("Pele", 10), Player.new("Diego Maradona", 10)
    #     choice_2 = Player.new("Bobby Moore", 6), Player.new("Franz Beckenbauer", 5)
    #     choice_3 = Player.new("Lev Yashin", 1), Player.new("Dino Zoff", 1)
    #     choice_4 = Player.new("Didier Deschamps", 7), Player.new("Paul Breitner", 8)
    #     choice_5 = Player.new("Cafu", 2), Player.new("Marco Tardelli", 14)
    #     team_user = Teams.new(team_name, team_new_players, 0, captain, team_new_toss, team_attack_1, team_attack_2, team_attack_3, team_defend_1, team_defend_2, team_defend_3, team_extra)
    # end
end