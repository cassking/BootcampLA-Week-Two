require "sinatra"
require "pry" if development? || test?
require "sinatra/reloader" if development?

require_relative "models/player"
require_relative "models/team"
require_relative "models/team_data"

set :bind, '0.0.0.0'  # bind to all interfaces

get "/" do
  "<h1>The LACKP Homepage<h1>"
end

get "/teams" do
   @teams = Team.all
  erb :teams
end

get "/players" do
  @players = Player.all
  erb :players
end

get "/teams/:team_name" do
  @team_name = params[:team_name]
  @full_team = Team.new(@team_name)
  @players_on_team = @full_team.players
  erb :team_show_page
end

get "/teams/:position" do
  @position = params[:position]
  # TO DO LINK ONE POSTIION TO SEE IF PARAMS WORK
  # @players_on_team = @full_team.players
  erb :positions
end
