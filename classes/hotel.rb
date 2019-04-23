require 'tty-prompt'
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

    def display_rooms
        puts "Room Type:"
        @rooms.each { |room| puts "    * #{room.type}"}
    end

    def choose_room
        display_rooms
        puts "Please select your room type:"
        room_choice = gets.chomp
    end
end

# TESTING

hotel = Hotel.new
hotel.add_room(Deluxe.new).add_room(Luxury.new)
hotel.choose_room



