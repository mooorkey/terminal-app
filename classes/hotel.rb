require_relative 'room'

class Hotel
    def initialize
        @name = "Purr Seasons"
        @address = "32 Cat St"
        @phone = "1800 MEOW MEOW"
        @rooms = []  # Array of room objects
    end

    def add_room(room)
        @rooms << room
        return self
    end
end

# TESTING

hotel = Hotel.new
hotel.add_room(Deluxe.new).add_room(Luxury.new)
p hotel



