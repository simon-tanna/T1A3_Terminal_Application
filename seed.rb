require "faker"
require_relative './classes/teams.rb'
require_relative './classes/players.rb'
require_relative './classes/game.rb'
def seed

    team_1_players = ["player1", "player2", "player3", "player4", "player5"]
    team_2_players = ["player1", "player2", "player3", "player4", "player5"]
    # for i in 0..4
    #     user_team_players << Player.new(Faker::Sports::Football.player)
    #     bot_team_players << Player.new(Faker::Sports::Football.player)
    # end

    team_1 = Teams.new("Buffon's Barons", team_1_players, 0)
    team_2 = Teams.new("Barthez's Bandits", team_2_players, 0)

    teams_array = [team_1, team_2]
    game = Game.new("Football Shootout", "5-a-side football sim", teams_array)
    return game
end
