require './lib/item'
require './lib/vendor'

class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
   @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end
  
  def vendors_that_sell(item)
    in_stock_here = []
    @vendors.each do |vendor|
      if vendor.inventory.key?(item)
      in_stock_here << vendor
      end
    end
    in_stock_here
  end

end
