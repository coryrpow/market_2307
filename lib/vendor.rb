require './lib/item'

class Vendor
  attr_reader :name, :inventory  

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
   @inventory.fetch(item, 0)
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def potential_revenue
    vendor_revenue_total = 0.0

    @inventory.each do |item, amount|
      vendor_revenue_total += item.price * amount.to_f
    end
    vendor_revenue_total
  end
end
