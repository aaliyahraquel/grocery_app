require "pg"

class Grocery

  @basket = []

  def self.all
    connection = PG.connect(dbname: 'grocerydb')

    result = connection.exec("SELECT * FROM groceries;")
    result.map { |groceries|
      Grocery.new(id: groceries['id'], item: groceries['items'], price: groceries['price'], category: groceries['category'])
    }
  end

  def self.cart(item)

    connection = PG.connect(dbname: 'grocerydb')
    result = connection.exec("SELECT * FROM groceries WHERE items = '#{item}';")

    result.map { |groceries|
      Grocery.new(id: groceries['id'], item: groceries['items'], price: groceries['price'], category: groceries['category'])
    }
  end

  def self.basket(choice)
    @basket << choice
  end
  attr_reader :id, :item, :price, :basket, :category

  def initialize(id:, item:, price:, category:)
    @id = id
    @item = item
    @price = price
    @category = category
  end
end
