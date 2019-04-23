require 'tty-prompt'
require 'artii'
require_relative 'room'
require_relative '../methods/methods'

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

    def contact_info
        puts "#{@name}"
        puts "#{@address}"
        puts "#{@phone}"
        puts "#{@email}"
        puts "#{@about}"
    end

    def add_room(room)
        @rooms << room
        return self
    end

    def select_room
        menu = []
        @rooms.each { |room| menu.push(room.type)}
        selection = TTY::Prompt.new.select("Choose a room type", menu, cycle: true, marker: '>', echo: false,)
            @rooms.each { |room| return room if room.type == selection }
    end

    def welcome
        puts HEADER_LINE
        puts "WELCOME TO THE".center(HEADER_LENGTH)
        puts "#{@name} Hotel!".center(HEADER_LENGTH)
        puts HEADER_LINE
    end

end

# TESTING

# hotel = Hotel.new
# hotel.add_room(Deluxe.new).add_room(Luxury.new)
# p hotel.select_room



