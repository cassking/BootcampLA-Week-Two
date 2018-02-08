require "spec_helper"

RSpec.describe Team do
  # Team specs go here.
  describe ".new" do
    it "takes a name  as argument" do
      team = Team.new("Kickitall")
      expect(team).to be_a(Team)
    end
  end

  let(:team) { Team.new("BallsOfFury") }
  let(:player1) {Player.new("Maria Moss", "Kicker", "BallsOfFury") }
  let(:player2) {Player.new("SUsan ROll", "Outfielder", "BallsOfFury") }
  let(:player3) {Player.new("Ken Moss", "Kicker", "NotONballs") }

  describe "name" do
    it "has an attribute reader for name" do
      expect(team.name).to eq("BallsOfFury")
    end

    it "does not have an attribute writer for name" do
      expect { team.name = "NotsoFurious" }.to raise_error(NoMethodError)
    end
  end

    describe "#all" do
    it "instance method should show all teams in array" do
      team.all
      expect(team.all).to eq(Array)
    end
  end

  describe "#players" do
    it "has an instance method for players" do
      expect(team.players.count).to eq(2)
      expect(team.players).to eq(Array)
    end
  end

end
