# require_relative 'room'
# require_relative 'hotel'
require_relative 'cat'
require_relative '../methods/methods'

class Booking
    attr_reader :days

    def initialize(room, days)
        @room = room      # room object
        @days = days     # an array of the days associated with the booking
    end

    def display_booking(cat)
        puts HEADER_LINE
        puts "#{cat.name.upcase}'S BOOKING".center(HEADER_LENGTH)
        puts HEADER_LINE
        puts
        puts "Room Type: #{@room.type}"
        @room.display_features
        puts
        puts "Booking Days:"
        @days.each { |day| puts "       * #{day}"}
        puts
        puts HEADER_LINE
        puts "#{@days.length} days @ $#{@room.price} each".rjust(HEADER_LENGTH)
        puts "Total Price: $#{'%.2f' % booking_price}".rjust(HEADER_LENGTH)

    end

    def booking_price
        return @room.price.to_f * @days.length
    end

end

# TEST
# booking = Booking.new( Luxury.new, ["monday", "tuesday", "wednesday"])
# booking.display_booking


