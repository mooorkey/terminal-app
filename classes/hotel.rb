require 'tty-prompt'
require_relative 'room'
require_relative '../methods/pretty'

class Hotel
    attr_reader :rooms

    def initialize
        @name = "Purr Seasons"
        @address = "32 Cat St"
        @phone = "1800 MEOW MEOW"
        @email = "say_meow@purrseasons.com"
        @rooms = []  # Array of room objects
        @about = "~ An Experience Your Cat Wont Forget ~ \n The Purr Seasons is a luxury cat hotel. \n It's so good you'll wish you could stay too!"
    end

    def contact_info
        puts HEADER_LINE
        puts "#{@name.upcase}".center(HEADER_LENGTH)
        puts HEADER_LINE
        puts " Address: #{@address}"
        puts " Phone No: #{@phone}"
        puts " Email: #{@email}"
        puts
        puts "   #{@about}"
        puts HEADER_LINE
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



