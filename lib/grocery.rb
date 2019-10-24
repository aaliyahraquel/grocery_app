require "pg"

class Grocery
  def self.all
    connection = PG.connect(dbname: 'grocerydb')

    result = connection.exec("SELECT * FROM groceries;")
    result.map { |groceries|
      Grocery.new(id: groceries['id'], item: groceries['items'], price: groceries['price']) }

  end

  def self.cart(item)
    @cart = []
    @cart << item
    return @cart
  end

  attr_reader :id, :item, :price

  def initialize(id:, item:, price:)
    @id = id
    @item = item
    @price = price
  end
end

items = Grocery.all
puts "#{items}"
