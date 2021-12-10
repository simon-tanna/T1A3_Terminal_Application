require_relative "../classes/game"
require_relative "../classes/teams"
require_relative "../classes/players"
require_relative "../classes/user_options"
require_relative "../classes/score"
require_relative "../seed"
require_relative "../index"
# This is the first test created for the program.
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
        team_info = [Teams.new("Buffon's Barons", team_1_players, 1), Teams.new("Barthez's Bandits", team_2_players, 0)]
        expect(team_info.length).to eq(2)
        expect(team_info[0].name).to eq("Buffon's Barons")
        expect(team_info[1].players).to eq(team_2_players)
        expect(team_info[0].score).to be == 1
    end
end

describe