require_relative "../classes/game"
require_relative "../classes/username"
require_relative "../classes/teams"
require_relative "../classes/players"
require_relative "../classes/useroptions"
require_relative "../classes/score"

describe Score do
    it "it should return the user team score" do
        user_team = "Buffon's Barons"
        score = 3
        score_hash = Score.new(user_team,score)
        expect(score_hash.score).to eq(score)
    end

end