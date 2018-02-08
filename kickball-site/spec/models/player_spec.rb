require "spec_helper"

RSpec.describe Player do
  # Player specs go here.
  describe ".new" do
    it "takes a name , position and team_name as arguments" do
      player = Player.new("Sam Seaborn", "Pitcher", "Kickitall")
      expect(player).to be_a(Player)
    end
  end

  let(:player) {Player.new("Maria Moss", "Kicker", "BallsOfFury") }

  describe "name" do
    it "has an attribute reader for name" do
      expect(team.name).to eq("BallsOfFury")
    end

    it "does not have an attribute writer for name" do
      expect { team.name = "NotsoFurious" }.to raise_error(NoMethodError)
    end
  end


  describe "#position" do
    it "has an attribute reader for position" do
      expect(player.position).to eq("Kicker")
    end

    it "does not have an attribute writer for position" do
      expect { player.position = "Outfielder" }.to raise_error(NoMethodError)
    end
  end

  describe "#team_name" do
    it "has an attribute reader for team_name" do
      expect(player.team_name).to eq("BallsOfFury")
    end

    it "does not have an attribute writer for team_name" do
      expect { player.team_name = "HollyBalls" }.to raise_error(NoMethodError)
    end
  end

  describe "::all" do
      it 'class method should turn all players into player objects and return them as an array' do
        all_players = Player.all
        expect(all_players).to include(a_kind_of(Player))
    end
  end
end
