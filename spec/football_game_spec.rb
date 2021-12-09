require_relative "../classes/game"
require_relative "../classes/username"
require_relative "../classes/teams"
require_relative "../classes/players"
require_relative "../classes/user_options"
require_relative "../classes/score"

# This is the first test created for the program.
# It is testing the Score class
describe Score do
    it "it should return the team score" do
        team = "Buffon's Barons"
        score = 3
        score_return = Score.new(team,score)
        expect(score_return.score).to eq(score)
    end
    it "it should return the team name" do
        team = "Buffon's Barons"
        score = 3
        score_return = Score.new(team,score)
        expect(score_return.team).to eq(team)
    end
end