require './lib/item'

class Vendor
  attr_reader :name,
              :inventory  

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
   @inventory.fetch(item, 0)
  
  #  @inventory.each do |stock|
    
  #   end
  end

  def stock(item, amount)

    @inventory[item] += amount

  end
end
