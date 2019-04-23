require_relative 'room'
require_relative 'hotel'

class Booking
    
    def initialize(room, days)
        @room = room      # room object
        @days = days     # an array of the days associated with the booking
    end

    def display_booking
        puts # Hotel information
        puts # Guest details
        puts "Room Type: #{@room.type}"
        puts # Room features
        puts "Booking Days:"
        puts @days  # MAKE THIS PRETTY ON ONE LINE
        puts "#{@days.length}x $#{@room.price}"
        puts "Total Price: $#{'%.2f' % booking_price}"

    end

    def booking_price
        return @room.price.to_f * @days.length
    end

end

# TEST
# booking = Booking.new( Luxury.new, ["monday", "tuesday", "wednesday"])
# booking.display_booking


