class Product
  attr_reader :name, :price, :discount_quantity, :discount_price
  def initialize(name, price, discount_quantity, discount_price)
    @name = name
    @price = price
    @discount_quantity = discount_quantity
    @discount_price = discount_price
  end
end