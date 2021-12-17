require_relative './product'

class ItemsList < Product

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

  def self.get_input(purchased)
    convert_input(purchased)
  end

  def self.input_purchased
    validated = get_input(@purchased)
    @uniq_items = validated.uniq
    
    # Waiting for a valid input
    while is_a_valid_input?(@purchased, @uniq_items, @stored_items)
      puts "Please enter a valid item(s) or type [quit] to exit"
      @purchased = gets.chomp.split(",")
      validated = get_input(@purchased)
      @uniq_items = validated.uniq
    end

    exit if quit?(@purchased)

    total_amounts = calculate_amounts(validated, @store)

    puts "Total price: #{total_amounts[0]}"
    puts "You Saved: #{(@total_saved - total_amounts[0]).round(2)}"
  end

  def self.convert_input(purchased)
    # Remove any leading and trailing white spaces and convert to downcase
    validated = []
    purchased.each { |p| validated << p.strip.downcase }
    validated
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

  # Print first message and table
  show_price_table()
  # Calculate total amount
  input_purchased()
end