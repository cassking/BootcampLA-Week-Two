require_relative "./team_data"

class Team

  attr_reader :name
  def initialize(name)
    @name = name
  end

  def self.all
    TeamData::ROLL_CALL.keys
  end

  # def self.players
  #     @full_teams =[]
  #       TeamData::ROLL_CALL.each do | team, player_info |
  #         player_info.each do | p_name, p_position |
  #           @full_teams << Player.new(p_name,p_position,team)
  #         end
  #       end
  #       @full_teams
  #   end

  def players
      @full_teams =[]
        TeamData::ROLL_CALL.each do | team, player_info |
          # binding.pry

        if team.to_s == @name
          player_info.each do | p_name, p_position |
            @full_teams << Player.new(p_name,p_position,team)
          end
        end
        end
        @full_teams
    end
  end
