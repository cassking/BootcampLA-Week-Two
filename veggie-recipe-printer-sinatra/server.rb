require "sinatra"

require "sinatra/reloader" if development?
require "pry" if development? || test?

set :bind, "0.0.0.0"
set :public_folder, File.dirname(__FILE__) + '/public'
recipe = {
  name: "Roasted Brussels Sprouts ",
  ingredients: [
    "1 1/2 pounds Brussels sprouts",
    "3 tablespoons good olive oil",
    "3/4 teaspoon kosher salt",
    "1/2 teaspoon freshly ground black pepper"
  ],
  directions: [
    "Preheat oven to 400 degrees F.",
    "Cut off the brown ends of the Brussels sprouts.",
    "Pull off any yellow outer leaves.",
    "Mix them in a bowl with the olive oil, salt and pepper.",
    "Pour them on a sheet pan and roast for 35 to 40 minutes.",
    "They should be until crisp on the outside and tender on the inside.",
    "Shake the pan from time to time to brown the sprouts evenly.",
    "Sprinkle with more kosher salt ( I like these salty like French fries).",
    "Serve and enjoy!"
  ]
}

reviews = [
{
    username: "Omar Little",
    rating: 3,
    review: "Its all in the sprout, yo"
  },
  {
    username: "Stringer Bell",
    rating: 3,
    review: "If the sprout  comin, make ready for the sprout."
  },
  {
    username: "Marlo Stanfield",
    rating: 2,
    review: "Either eat it or dont, but I got some place to be"
  },
  {
    username: "Prop Joe",
    rating: 5,
    review: "It looked the aprt , and WAS the part"
  },
  {
    username: "Avon Barksdale",
    rating: 3,
    review: "I aint no suit-wearin businessman like you... you know Im just a gangsta here to enjoy ma food, I suppose..."
}
]
get '/' do
  @name = recipe[:name]
  @ingredients = recipe[:ingredients]
  @directions = recipe[:directions]
  @reviews = reviews
  erb :index
end

get '/reviews' do
  @reviews =   reviews
  erb :reviews
end

get '/usernames' do
  @names = []
  @reviews =   reviews
  @reviews.each do |item|
    string = item[:username]
    @names << string
  end
  erb :usernames
end

get '/usernames/:username' do
  @names = []
  @reviews =   reviews
   @reviews.each do |item|
     string = item[:username]
     @item = item[:username]
     @names << string
   end
   @username = params[:username]
  erb :one_name
end
