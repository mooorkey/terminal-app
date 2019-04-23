require_relative 'room'

class Booking
    def initialize(room)
        @room = room
        @days = []      # an array of the days associated with the booking
    end
end

# TEST
booking = Booking.new(Luxury.new)
p booking

