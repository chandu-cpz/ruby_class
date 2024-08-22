class Movie
  attr_accessor :title, :show_time, :tickets_available, :ticket_prices

  def initialize(title, show_time, tickets_available, ticket_prices)
    @title = title
    @show_time = show_time
    @tickets_available = tickets_available
    @ticket_prices = ticket_prices
  end

  def display_movie_details
    puts "Movie Title: #{@title}"
    puts "Show Time: #{@show_time}"
    puts "Tickets Available: #{@tickets_available}"
    puts "Ticket Prices: #{@ticket_prices}"
  end

  def check_ticket_availability
    if @tickets_available > 0
      puts "Tickets available: #{@tickets_available}"
    else
      raise StandardError, "Sorry, the show is sold out!"
    end
  end

  def calculate_total_price(ticket_type, quantity)
    raise ArgumentError, "Invalid ticket type!" unless @ticket_prices.key?(ticket_type)
    @ticket_prices[ticket_type] * quantity
  end

  def book_tickets(ticket_type, quantity)
    raise ArgumentError, "Quantity must be positive!" if quantity <= 0
    raise StandardError, "Not enough tickets available!" if @tickets_available < quantity

    total_price = calculate_total_price(ticket_type, quantity)
    @tickets_available -= quantity
    puts "Tickets booked successfully! Total price: #{total_price}"
  end
end

movie = Movie.new("Inception", "10:00 PM", 100, { "Adult" => 15, "Child" => 10 })
movie.display_movie_details

begin
  movie.check_ticket_availability
  puts "Booking 5 adult tickets..."
  movie.book_tickets("Adult", 5)
  puts "Booking 3 child tickets..."
  movie.book_tickets("Child", 3)
  puts "Trying to book -1 tickets..."
  movie.book_tickets("Adult", -1)
rescue StandardError => e
  puts "Error: #{e.message}"
end

puts "\nUpdated movie details:"
movie.display_movie_details

begin
  puts "Booking 200 Adult Tickets..."
  movie.book_tickets("Adult", 200)
rescue StandardError => e
  puts "Error: #{e.message}"
end
