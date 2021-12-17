require_relative './validation'

class Product < Validations
  attr_reader :name, :price, :discount_quantity, :discount_price
  def initialize(name, price, discount_quantity, discount_price)
    @name = name
    @price = price
    @discount_quantity = discount_quantity
    @discount_price = discount_price
  end

  def has_discount?
    self.discount_quantity > 0
  end

  def self.total_amount(product, quantity)
    # Calculate total amount whether the product has discount or not
    unless product.has_discount?
      quantity * product.price
    else
      total_discount_price = (quantity/product.discount_quantity) * product.discount_price
      total_regular_price = (quantity%product.discount_quantity) * product.price

      total_discount_price + total_regular_price
    end
  end
end