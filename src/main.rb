class ItemsList
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