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

  def sorted_item_list(vendor)
    item_names = []

    @vendors.each do |vendor|
      vendor.inventory.each do |item, _|
        item_names << item.name
      end
    end

    alphabetized_items = item_names.uniq.sort
    alphabetized_items
  end

end
