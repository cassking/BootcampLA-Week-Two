require "sinatra"
require 'csv'
require "sinatra/reloader" if development?
require "pry" if development? || test?

set :bind, '0.0.0.0'  # bind to all interfaces

get '/' do
  redirect '/grocery-list'
end

get '/grocery-list' do
  @groceries = CSV.readlines('grocery_list.csv', headers:true)
  erb :index
end

post '/grocery-list' do
  name = params[:name]
  if !name.empty?
    CSV.open("grocery_list.csv", "a") do |csv|
      csv << [name]
    end
  redirect '/grocery-list'
  else
    @groceries = CSV.readlines('grocery_list.csv', headers:true)
    erb :index
    # erb :error
  end
end
