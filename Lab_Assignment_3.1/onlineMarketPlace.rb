class OnlineMarketplace
  def initialize
    @product_catalog = []
  end

  def add_product(name, price, quantity)
    @product_catalog << Product.new(name, price, quantity)
  end

  def total_value
    @product_catalog.sum { |product| product.total_value }
  end

  def print_all_products
    @product_catalog.each { |product| puts product }
  end
end

class Product
  attr_accessor :name, :price, :quantity

  def initialize(name, price, quantity)
    @name = name
    @price = price
    @quantity = quantity
  end

  def total_value
    @price * @quantity
  end

  def to_s
    "Name: #{@name}, Price: $#{@price}, Quantity: #{@quantity}, Total Value: $#{total_value}"
  end
end

marketplace = OnlineMarketplace.new
marketplace.add_product("Laptop", 1200, 10)
marketplace.add_product("Phone", 800, 25)
marketplace.add_product("Tablet", 500, 15)

puts "All Products:"
marketplace.print_all_products

puts "\nTotal Value of All Products: $#{marketplace.total_value}"
