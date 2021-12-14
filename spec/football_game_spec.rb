require_relative "../classes/game"
require_relative "../classes/teams"
require_relative "../classes/players"
require_relative "../classes/score"
require_relative "../seed"
require_relative "../index.rb"
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
describe "Test score and team values" do
    # This is testing the initialization of score and team attribute
    it "it should store the attributes of the Score class correctly" do
        team = "Buffon's Barons"
        score = 3
        score_return = Score.new(team,score)
        expect(score_return.score).to eq(score)
        expect(score_return.team).to eq(team)
    end
end

describe "Test team values" do
    # This will test the input results
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

describe "Test User Team Values"
    

