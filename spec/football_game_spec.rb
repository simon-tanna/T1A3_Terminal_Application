require_relative "../classes/game"
require_relative "../classes/username"
require_relative "../classes/teams"
require_relative "../classes/players"
require_relative "../classes/user_options"
require_relative "../classes/score"

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

describe "Test UserOptions objects" do
    # This will test the input results
    it "it should store the array of options "


# end