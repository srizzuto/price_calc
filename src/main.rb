class ItemsList

  def self.show_price_table
    puts "This week prices table:\n\n"
    puts "Item    Unit Price      Sale Price"
    puts "-----------------------------------"

    @store.each { |product|
      puts "#{product.name}\t$#{product.price}\t\t".concat(product.has_discount? ? "#{product.discount_quantity} for $#{product.discount_price}" : "")
    }

    puts "\nPlease enter all the items purchased separated by a comma:"
    @purchased = gets.chomp.split(",")
  end
  
  # Program begins...
  # Create products
  @milk = Product.new("Milk", 3.97, 2, 5.00)
  @bread = Product.new("Bread", 2.17, 3, 6.00)
  @banana = Product.new("Banana", 0.89, 0, 0)
  @apple = Product.new("Apple", 0.99, 0, 0)

  # Create store with products
  @store = [@milk, @bread, @banana, @apple]
  # Create array of products names
  @stored_items = @store.map { |product| product.name.downcase }
end