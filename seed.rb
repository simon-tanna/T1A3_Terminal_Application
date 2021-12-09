require "faker"
require_relative './classes/teams.rb'
require_relative './classes/players.rb'
require_relative './classes/game.rb'
def seed

    user_team_players = []
    bot_team_players = []
    for i in 1..5
        user_team_players << Player.new(i, Faker::Sports::Football.player)
        bot_team_players << Player.new(i, Faker::Sports::Football.player)
    end

    user_team = Teams.new("Buffon's Barons", user_team_players, 0)
    bot_team = Teams.new("Barthez's Bandits", bot_team_players, 0)

    teams_array = [user_team, bot_team]
    game = Game.new(teams_array)
    return game
end
