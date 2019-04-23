# require 'tty-prompt'
require_relative 'room'

class Hotel
    attr_reader :rooms

    def initialize
        @name = "Purr Seasons"
        @address = "32 Cat St"
        @phone = "1800 MEOW MEOW"
        @email = "say_meow@purrseasons.com"
        @rooms = []  # Array of room objects
    end

    def contact
        puts "#{@name}"
        puts "#{@address}"
        puts "#{@phone}"
        puts "#{@email}"
    end

    def add_room(room)
        @rooms << room
        return self
    end

    def display_rooms
        puts "Room Type:"
        @rooms.each { |room| puts "#{room.type}" }
    end

    def choose_room
        puts "Please select a room type to view more information:"
        room_choice = gets.chomp.capitalize
        @rooms.each do |room|
            if room_choice == room.type
                # Display details of room selected
                return room
            end
        end
        # if it gets here, it hasn't found a room
        puts "Sorry that is not a valid selection, please enter a valid room type."
        # WE NEED A WAY TO QUIT
        choose_room
    end

end

# TESTING

# hotel = Hotel.new
# hotel.add_room(Deluxe.new).add_room(Luxury.new)
# hotel.choose_room



