require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  before do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor = Vendor.new("Rocky Mountain Fresh")

  end

  describe "#initialize" do
    it "exists and has readable attributes" do
      expect(@vendor).to be_a(Vendor)

      expect(@item1.name).to eq('Peach')
      expect(@item1.price).to eq(0.75)

      expect(@vendor.name).to eq("Rocky Mountain Fresh")
      expect(@vendor.inventory).to eq({})
    end
  end



end