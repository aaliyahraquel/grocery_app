require "sinatra/base"
require './lib/grocery'
require "pg"


class GroceryApp < Sinatra::Base

  get ('/') do
    @grocery = Grocery.all
    "Welcome to the Grocery App!"
    erb :index
  end

  run! if app_file == $0
end
