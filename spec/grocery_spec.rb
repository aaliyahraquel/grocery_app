require "grocery"
require "pg"


  describe "Viewing items" do
    describe '.all' do
      it 'returns the list of items' do
        items = Grocery.all

        expect(items).to include("Bread")
      end
    end
  end
