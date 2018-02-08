require_relative "./team_data"

class Player
  attr_reader :name, :position, :team_name

  def initialize(name,position, team_name)
    @name = name
    @position = position
    @team_name = team_name
  end

  # def self.all
  #   @players = []
  #     TeamData::ROLL_CALL.values.each do | team |
  #       team.each do | player |
  #         @players << player
  #       end
  #     end
  #     @players
  # end

  def self.all
    @players_teams = []
      TeamData::ROLL_CALL.each do | team, player_info |
        player_info.each do | p_name, p_position |
          @players_teams << Player.new(p_name,p_position,team)
        end
      end
      @players_teams
      # binding.pry
  end
end
