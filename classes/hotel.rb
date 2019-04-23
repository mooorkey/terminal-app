require 'tty-prompt'
require_relative 'room'

class Hotel
    attr_reader :rooms

    def initialize
        @name = "Purr Seasons"
        @address = "32 Cat St"
        @phone = "1800 MEOW MEOW"
        @email = "say_meow@purrseasons.com"
        @rooms = []  # Array of room objects
        @about = "blurb about the hotel"
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

    def select_room
        prompt = TTY::Prompt.new
        menu = []
        @rooms.each { |room| menu.push(room.type)}
        selection = prompt.select("Choose a room type", menu, cycle: true, marker: '>', echo: false,)
            @rooms.each { |room| return room if room.type == selection }
    end

end

# TESTING

# hotel = Hotel.new
# hotel.add_room(Deluxe.new).add_room(Luxury.new)
# p hotel.select_room



