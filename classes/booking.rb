require_relative 'room'
require_relative 'hotel'

class Booking
    def initialize
        @room = ""      # room object
        @days = []      # an array of the days associated with the booking
    end

    def choose_room

    end

    def choose_days

    end
end

# TEST
booking = Booking.new
p booking

