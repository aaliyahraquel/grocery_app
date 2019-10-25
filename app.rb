require 'sinatra/base'
require './lib/grocery'
require 'pg'


class GroceryApp < Sinatra::Base

  get ('/') do
    @grocery = Grocery.all
    'Welcome to the Grocery App!'
    erb :index
  end

  post '/choice' do
    @choice = params['choice']
    @cart = Grocery.cart(@choice)

    "Your shopping list is: #{@cart}"
    # "#{@cart} has been added!"
  end
end



  run! if app_file == $0

end
