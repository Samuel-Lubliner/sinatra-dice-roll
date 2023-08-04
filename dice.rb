require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
  
# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:elephant)
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get "/dice/:num_dice/:num_sides" do
  @rolls = []
  num_dice = params[:num_dice].to_i
  num_sides = params[:num_sides].to_i

  num_dice.times do
    die = rand(1..num_sides)
    @rolls.push(die)
  end

  erb :dice
end
