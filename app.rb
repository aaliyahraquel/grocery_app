require 'sinatra/base'
require './lib/grocery'
require 'pg'


class GroceryApp < Sinatra::Base

  get ('/') do
    @grocery = Grocery.all
    erb :index
  end

  post '/choice' do
    @choice = params['choice']
    @cart = Grocery.cart(@choice)
    @basket = Grocery.basket(@choice)
    erb :form

  end
end
