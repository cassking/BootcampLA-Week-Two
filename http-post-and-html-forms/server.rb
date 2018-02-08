require "sinatra"

require "pry" if development? || test?
require "sinatra/reloader" if development?

set :bind, '0.0.0.0'  # bind to all interfaces

get "/tasks" do
  @tasks = File.readlines("tasks.txt")
  erb :index
end

get "/tasks/:task_name" do
  @task_name = params[:task_name]
  erb :show
end

post "/tasks" do
  # Temporarily insert a debugger breakpoint here so
# we can view the *params* hash.
# binding.pry
#PARAMS HASH LOOKS LIKE => {"task_name"=>"take over the world"}
  # Read the input from the form the user filled out
   task = params["task_name"]

  # Open the "tasks" file and append the task
  File.open("tasks.txt", "a") do |file|
    file.puts(task)
  end

  # Send the user back to the home page which shows
  # the list of tasks
   redirect "/tasks"
 end
