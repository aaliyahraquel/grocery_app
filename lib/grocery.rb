require "pg"

class Grocery
  def self.all
    connection = PG.connect(dbname: 'grocerydb')

    result = connection.exec("SELECT * FROM groceries;")
    result.map do |groceries|
      Grocery.new(id: groceries['id'], items: groceries['items'], price: groceries['price'])
    end
  end

attr_reader :id, :item, :price

  def initialize(id:, item:, price:)
    @id = id
    @price = price
    @item = item
  end
end
