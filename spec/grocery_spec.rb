require "grocery"
require "pg"


  describe "Viewing items" do
    describe '.all' do
      it 'returns the list of items' do
        groceries = Grocery.all

        expect(groceries.first).to be_a Grocery
      end
    end
  end

  describe "Adding to cart" do
    describe '.cart' do
      it 'saves item to cart' do
        cart = Grocery.cart("food")

        expect(cart).to be_a Array
        expect(cart).to include 'food'
      end
    end
  end
