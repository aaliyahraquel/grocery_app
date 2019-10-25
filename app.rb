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
    @category = Grocery.categorize(@cart)
    "Your shopping list is: #{@cart}, #{@category}"
    # "#{@cart} has been added!"
  end
end
