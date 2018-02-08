require 'sinatra'

require 'sinatra/reloader' if development?
require 'pry' if development? || test?

set :bind, '0.0.0.0'
# # The %20 is a special character to represent empty space in a URL
# get '/tasks/pay%20bills'   #...
# get '/tasks/buy%20milk'    #...
# get '/tasks/learn%20ruby'  #...

get '/tasks' do
  @tasks = ['pay bills', 'buy milk', 'learn Ruby']
  erb :index
end

get '/tasks/:task_name' do
  @task_name = params[:task_name]
  erb :show
end
