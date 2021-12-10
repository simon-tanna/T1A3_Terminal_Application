class Game
    def initialize(name, description, teams)
        @name = name
        @description = description
        @teams = teams
    end

    def to_s
        "#{@name}! The greatest #{@description}"
    end

    def print_teams
        @teams.each do |team|
            team
        end
    end
end 