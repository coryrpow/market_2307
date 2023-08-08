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

  def total_inventory
    total_items = {}
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        total_items[item] ||= {quantity: 0, vendors: []}
        total_items[item] [:quantity] += quantity
        total_items[item] [:vendors] << vendor
      end
    end
    total_items
  end

  def overstocked_items
    overstocked_items = []
    total_inventory.each do |item, value|
      if value[:vendors].count > 1 && value[:quantity] > 50
        overstocked_items << item
      end
    end
    overstocked_items
  end
end
