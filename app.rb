require "sinatra/base"
require "pg"

class GroceryApp < Sinatra::Base

  get ('/') do
    grocery = Grocery.new
    "Welcome to the Grocery App!"
  end

  run! if app_file == $0
end
