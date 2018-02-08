require "sinatra"
require 'csv'
require "pry" if development? || test?
require "sinatra/reloader" if development?
set :bind, '0.0.0.0'  # bind to all interfaces

get "/" do
  redirect '/teams'
end

get "/teams" do
  @flat_team_array =[]
  @teamdata = CSV.readlines('data.csv', headers:true)
  @teamdata.each do |info|
      @flat_team_array<< info["team"]
  end
  @flat_team_array = @flat_team_array.uniq
   # binding.pry
  erb :index
end

get "/:team" do
  @team = params["team"]
  @fullteam =[]
  @teamdata = CSV.readlines('data.csv', headers:true)
  @teamdata.each do |info|
    if info["team"] == params["team"]
      player = info["player"]
      position = info["position"]
      @fullteam<<[player,position]
    end
    @fullteam
  end
  #fetch params
    # binding.pry
  erb :team
end
