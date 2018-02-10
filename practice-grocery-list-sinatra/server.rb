require "sinatra"
require 'csv'
require "pry" if development? || test?
require "sinatra/reloader" if development?
set :bind, '0.0.0.0'  # bind to all interfaces

get '/' do
  redirect '/grocery-list'
end

get '/grocery-list' do
  # binding.pry
  @data = CSV.readlines('grocery_list.csv', headers:true)
  # binding.pry
  #render my list using index.erb
  erb :index
end

post '/grocery-list' do
     # binding.pry
  @error =''
  name = params[:name]
  if !name.empty? #happy path
    #remember that file names in .open need quotes
    CSV.open('grocery_list.csv', 'a') do |csv|
      csv << [name]
    end
    #if all is good, redirect to page else
  redirect '/grocery-list'
  else
    @error = "please provide a   name"
    #if data is bad stay at index.erb you will need to render data here, obviously so provide unchanged data file
    @data = CSV.readlines('grocery_list.csv', headers:true)
    erb :index
  end
end
