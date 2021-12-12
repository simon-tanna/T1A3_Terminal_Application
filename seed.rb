require "faker"
require_relative './classes/teams.rb'
require_relative './classes/players.rb'
require_relative './classes/game.rb'
def seed

    # team_1_players = ["player1", "player2", "player3", "player4", "player5"]
    # team_2_players = ["player1", "player2", "player3", "player4", "player5"]

    #These are the empty arrays to contain the player details generated by faker
    team_1_players = []
    team_2_players = []
    team_3_players = []
    team_4_players = []

    #This is the loop to generate the player names from faker
    for i in 1..5
        team_1_players << Player.new(Faker::Sports::Football.player, i ,Faker::Sports::Football.position)
    end
    for i in 1..5
        team_2_players << Player.new(Faker::Sports::Football.player, i ,Faker::Sports::Football.position)
    end
    for i in 1..5
        team_3_players << Player.new(Faker::Sports::Football.player, i ,Faker::Sports::Football.position)
    end
    for i in 1..5
        team_4_players << Player.new(Faker::Sports::Football.player, i ,Faker::Sports::Football.position)
    end

    team_1_captain = "Gianluigi Buffon"
    team_2_captain = "Fabian Barthez"
    team_3_captain = "Andoni Zubizarreta"
    team_4_captain = "Mark Schwarzer"

    #This will determine who wins the coin toss
    

    team_1 = Teams.new("Barons", team_1_players, 0, team_1_captain, "")
    team_2 = Teams.new("Bandits", team_2_players, 0, team_2_captain, "")
    team_3 = Teams.new("Zoomers", team_3_players, 0, team_3_captain, "")
    team_4 = Teams.new("Scamps", team_4_players, 0, team_4_captain, "")

    teams_array = [team_1, team_2, team_3, team_4]
    game = Game.new("Football Shootout", "5-a-Side Football Sim", teams_array)
    return game
end

