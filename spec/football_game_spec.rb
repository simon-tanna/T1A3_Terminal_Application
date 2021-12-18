require_relative "../classes/game"
require_relative "../classes/teams"
require_relative "../classes/players"
require_relative "../seed"
require 'faker'
# This is the test file for the simple football simulator game
=begin
This application is a simple football game sim where the user can make choices in game and results are random
The tests on this application can be run by
- run "bundle add" to add the rspec dependency
- run "rspec" in the project root directory
=end

# Adding welcome message for the football app

# It is testing the Score class

describe "Test team values" do
    it "it should store the TeamInfo correctly" do
        team_1_players = ["player1", "player2", "player3", "player4", "player5"]
        team_2_players = ["player1", "player2", "player3", "player4", "player5"]
        team_1_captain = "Buffon"
        team_2_captain = "Barthez"
        toss_result = ["heads", "tails"].sample
        attack_1 = "shoot"
        attack_2 = "shoot"
        attack_3 = "pass"
        defend_1 = "block"
        defend_2 = "slide"
        defend_3 = "block"
        extra = "shoot right"
        team_info = [Teams.new("Barons", team_1_players, 1, team_1_captain, toss_result, attack_1, attack_2, attack_3, defend_1, defend_2, defend_3, extra), Teams.new("Bandits", team_2_players, 0, team_2_captain, toss_result, attack_1, attack_2, attack_3, defend_1, defend_2, defend_3, extra)]
        expect(team_info.length).to eq(2)
        expect(team_info[0].name).to eq("Barons")
        expect(team_info[1].players).to eq(team_2_players)
        expect(team_info[0].score).to be == 1
        expect(team_info[1].captain).to eq(team_2_captain)
        expect(team_info[0].toss).to eq(toss_result)
        expect(team_info[1].attack_1).to eq("shoot")
        expect(team_info[0].attack_2).to eq("shoot")
        expect(team_info[1].attack_3).to eq("pass")
        expect(team_info[0].defend_1).to eq("block")
        expect(team_info[1].defend_2).to eq("slide")
        expect(team_info[0].defend_3).to eq("block")
        expect(team_info[0].extra).to eq("shoot right")
    end
end

describe "Test player values" do
    it "it should store the player details correctly" do
        team_array = []
        for i in 1..5
            team_array << Player.new(Faker::Sports::Football.player, i)
        end
        team_1 = team_array
        expect(team_1.length).to eq(5)
        expect(team_1[4].number).to be == 5
    end
end

describe "Test creation of players and teams for the game class" do
    it "it should store information in the game class correctly" do
        team_1_players = []
        team_2_players = []
        team_3_players = []
        team_4_players = []
        for i in 1..5
            team_1_players << Player.new(Faker::Sports::Football.unique.player, i)
        end
        for i in 1..5
            team_2_players << Player.new(Faker::Sports::Football.unique.player, i)
        end
        for i in 1..5
            team_3_players << Player.new(Faker::Sports::Football.unique.player, i)
        end
        for i in 1..5
            team_4_players << Player.new(Faker::Sports::Football.unique.player, i)
        end
        team_1_captain = "Gianluigi Buffon"
        team_2_captain = "Fabian Barthez"
        team_3_captain = "Rene Higuita"
        team_4_captain = "Mark Schwarzer"
        team_1_toss = ["heads", "tails"].sample
        team_2_toss = ["heads", "tails"].sample
        team_3_toss = ["heads", "tails"].sample
        team_4_toss = ["heads", "tails"].sample
        team_attack_1 = ["pass", "shoot"].sample
        team_attack_2 = ["dribble then shoot", "shoot from range"].sample
        team_attack_3 = ["pass", "shoot"].sample
        team_defend_1 = ["slide tackle", "block tackle"].sample
        team_defend_2 = ["slide tackle", "block tackle"].sample
        team_defend_3 = ["slide tackle", "block tackle"].sample
        team_extra = ["shoot left", "shoot right"].sample
        team_1 = Teams.new("Barons", team_1_players, 0, team_1_captain, team_1_toss, team_attack_1, team_attack_2, team_attack_3, team_defend_1, team_defend_2, team_defend_3, team_extra)
        team_2 = Teams.new("Bandits", team_2_players, 0, team_2_captain, team_2_toss, team_attack_1, team_attack_2, team_attack_3, team_defend_1, team_defend_2, team_defend_3, team_extra)
        team_3 = Teams.new("Pepitas", team_3_players, 0, team_3_captain, team_3_toss, team_attack_1, team_attack_2, team_attack_3, team_defend_1, team_defend_2, team_defend_3, team_extra)
        team_4 = Teams.new("Scamps", team_4_players, 0, team_4_captain, team_4_toss, team_attack_1, team_attack_2, team_attack_3, team_defend_1, team_defend_2, team_defend_3, team_extra)
        teams_array = [team_1, team_2, team_3, team_4]
        game = Game.new("Football Shootout", "5-a-Side Football Sim", teams_array)
        expect(game.name).to eq("Football Shootout")
        expect(game.description).to eq("5-a-Side Football Sim")
        expect(game.teams.length).to eq(4)
        expect(game.teams[0].name).to eq("Barons")
        expect(game.teams[1].players.length).to eq(5)
        expect(game.teams[2].captain).to eq(team_3_captain)
        expect(game.teams[3].toss).to eq(team_4_toss)
        expect(game.teams[0].players[2].number).to eq(3)
    end
end

    

