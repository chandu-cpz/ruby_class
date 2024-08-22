require 'date'

class Room
  attr_reader :room_no, :room_type, :bookings

  def initialize(no, type)
    @room_no = no
    @room_type = type
    @bookings = {}  # Key: check-in date, Value: check-out date
  end

  def available?(check_in, check_out)
    @bookings.none? do |booked_check_in, booked_check_out|
      (check_in >= booked_check_in && check_in < booked_check_out) ||
      (check_out > booked_check_in && check_out <= booked_check_out) ||
      (check_in <= booked_check_in && check_out >= booked_check_out)
    end
  end

  def book_room(check_in, check_out)
    if available?(check_in, check_out)
      @bookings[check_in] = check_out
      puts "Room #{room_no} booked from #{check_in} to #{check_out}"
      
    else
      puts "Room #{room_no} is not available for the specified dates"
      
    end
  end

  def cancel_reservation(check_in)
    if @bookings.key?(check_in)
      @bookings.delete(check_in)
      puts "Reservation for Room #{room_no} from #{check_in} has been canceled"
    else
      puts "No reservation found for Room #{room_no} on #{check_in}"
      
    end
  end

  def to_s
    "Room #{room_no}, Type: #{room_type}"
  end
end

class ReservationSystem
  def initialize
    @rooms = {}
  end

  def add_room(room)
    @rooms[room.room_no] = room
  end

  def list_all_rooms
    @rooms.values.each { |room| puts room }
  end

  def available_rooms(check_in, check_out)
    @rooms.values.select { |room| room.available?(check_in, check_out) }
  end

  def book_room(room_no, check_in, check_out)
    room = @rooms[room_no]
    if room
      room.book_room(check_in, check_out)
    else
      puts "Room #{room_no} not found"
      
    end
  end

  def room_bookings(room_no)
    room = @rooms[room_no]
    if room
      if room.bookings.empty?
        puts "No bookings for Room #{room_no}"
      else
        room.bookings.each { |check_in, check_out| puts "Booking: #{check_in} to #{check_out}" }
      end
    else
      puts "Room #{room_no} not found"
    end
  end
  def cancel_reservation(room_no, check_in)
    room = @rooms[room_no]
    if room
      room.cancel_reservation(check_in)
    else
      puts "Room #{room_no} not found"
      false
    end
  end
end


system = ReservationSystem.new
system.add_room(Room.new(101, 'Deluxe'))
system.add_room(Room.new(102, 'Non-AC'))

system.book_room(101, Date.parse('2024-09-01'), Date.parse('2024-09-05'))
system.book_room(102, Date.parse('2024-09-03'), Date.parse('2024-09-07'))

puts "Available rooms:"
system.available_rooms(Date.parse('2024-09-02'), Date.parse('2024-09-04')).each { |room| puts room }

puts "\nAll rooms:"
system.list_all_rooms

puts "\nBookings for room 101:"
system.room_bookings(101)
system.cancel_reservation(101, Date.parse('2024-09-01'))
