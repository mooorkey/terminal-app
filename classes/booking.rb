require_relative '../methods/headers'

# This class represents the booking object
class Booking
    attr_reader :days

    def initialize(room, days)
        @room = room      # room object
        @days = days      # an array of the days (strings) associated with the booking. 
    end

    # displays the booking
    def display_booking(cat, hotel)
        puts HEADER_LINE
        puts "#{cat.name.upcase}'S BOOKING".center(HEADER_LENGTH)
        puts HEADER_LINE
        puts
        puts hotel.name
        hotel.contact_info
        puts
        puts HEADER_LINE
        puts
        puts "Room Type: #{@room.type}"
        @room.display_features
        puts
        puts "Booking Days:"
        @days.each { |day| puts "       * #{day}"}
        puts
        if @activities
            display_booking_activities
        else
            puts HEADER_LINE
        end
        puts "#{@days.length} days @ $#{@room.price} each".rjust(HEADER_LENGTH)
        puts "Total Price: $#{'%.2f' % booking_price}".rjust(HEADER_LENGTH)
    end

    # calculates the booking price
    def booking_price
        return @room.price.to_f * @days.length
    end

end