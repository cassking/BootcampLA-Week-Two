require "sinatra"
require 'csv'
require "pry" if development? || test?
require "sinatra/reloader" if development?
set :bind, '0.0.0.0'  # bind to all interfaces

##set home
get '/' do
  # erb :index no this shows an error
    redirect '/articles'
end


get '/articles' do
  #instance variable to use in another file
  @articles = CSV.readlines('article-db.csv', headers:true)
  #see artiles first
  #need to chomp on csv here and display on page
  # binding.pry
  erb :index
end

get '/form' do
 #show form
  erb :show
end

get '/:author' do
  @author = params["author"]
  erb :show_author
end


post '/form' do
  @error =""
  title = params["title"]
  url = params["url"]
  description = params["description"]
  author = params["author"]
  CSV.open("article-db.csv", "a") do |csv|
      csv << [title,url,description,author]
  end
  if title.empty? || url.empty? || description.empty? || author.empty?
    #THROW ERROR IF EMPTY
    @error = "PLEASE FILL OUT ALL FIELDS"
  elsif description.size < 20
    @error = "you need at least 20 characters"
    halt erb :show
    #ELSE REDIREC TO HOME page
  else
    #right aftetr i post redirect to home page
    redirect '/articles'
  end
  #need to update csv here with any articles added via form
  erb :show
end
