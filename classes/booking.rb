require_relative 'cat'
require_relative '../methods/headers'

class Booking
    attr_reader :days

    def initialize(room, days, activities=nil)
        @room = room      # room object
        @days = days     # an array of the days (strings) associated with the booking. 
        @activities = activities   # an array of activities (objects) associated with the booking. These are objects so that we can access details associated with the activity - such as the price. 
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

    # displays if there are activities on the order
    def display_booking_activities
        puts "Activities:"
        
        @activities.each { |activity| puts "       *#{activity.name} - $#{activity.price}"}
        puts
        puts HEADER_LINE
        puts "#{@activities.length} activities - $#{activities_price}".rjust(HEADER_LENGTH)
    end


    # calculates the total price of the activities
    def activities_price
        activities_total = 0
        @activities.each { |activity| activities_total += activity.price.to_f}
        return activities_total
    end

    
    # calculates the booking price
    def booking_price
        if @activities
            return @room.price.to_f * @days.length + activities_price
        else
            return @room.price.to_f * @days.length
        end
    end

end

# TEST
# booking = Booking.new( Luxury.new, ["monday", "tuesday", "wednesday"])
# booking.display_booking


