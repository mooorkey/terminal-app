# require 'tty-prompt'
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
        @rooms.each { |room| puts "#{room.type}" }
    end

    def choose_room
        # @rooms.each do |room|
        #     room_menu.push(room.type)
        # end
        # menu = TTY::Prompt.new
        # menu.multi_select("Please select your room:", MENU, cycle: true, marker: '>', echo: false, per_page: 7).each do |room|
        #     room.select_days
        # end

        display_rooms
        puts "Please select a room type to view more information:"
        room_choice = gets.chomp.capitalize
        @rooms.each do |room|
            if room_choice == room.type
                room.display_room
                return 
            end
        end
        # if it gets here, it hasn't found a room
        puts "Sorry that is not a valid selection, please enter a valid room type."
        choose_room
    end

end

# TESTING

hotel = Hotel.new
hotel.add_room(Deluxe.new).add_room(Luxury.new)
hotel.choose_room



