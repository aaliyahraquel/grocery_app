require "sinatra/base"

class GroceryApp < Sinatra::Base

  get ('/') do
    "Welcome to the Grocery App!"
  end

run! if app_file == $0
end
