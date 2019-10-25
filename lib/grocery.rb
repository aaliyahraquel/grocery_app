require "pg"

class Grocery

  @cart = []
  def self.all
    connection = PG.connect(dbname: 'grocerydb')

    result = connection.exec("SELECT * FROM groceries;")
    result.map { |groceries|
      Grocery.new(id: groceries['id'], item: groceries['items'], price: groceries['price'], category: groceries['categories'])
    }
  end

  def self.cart(item)
    @cart << item

  end

  def self.categorize(cart)
    connection = PG.connect(dbname: 'grocerydb')
    cart.each { |item|
    result = connection.exec("SELECT * FROM groceries WHERE items = '#{item}';")

    result.map { |groceries|
      Grocery.new(id: groceries['id'], item: groceries['items'], price: groceries['price'], category: groceries['categories'])
    }
    }
  end


  attr_reader :id, :item, :price, :cart, :category

  def initialize(id:, item:, price:, category:)
    @id = id
    @item = item
    @price = price
    @category = category
  end
end
