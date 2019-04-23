require 'tty-prompt'
require_relative 'room'
require_relative '../methods/pretty'

class Hotel
    attr_reader :rooms, :name

    # We have initialized the hotel with all this data
    # If in the future we were to expand to different locations, we could create sub Hotel classes, and hard-code the information in there. 
    def initialize
        @name = "Purr Seasons"
        @address = "32 Cat St"
        @phone = "1800 MEOW MEOW"
        @email = "say_meow@purrseasons.com"
        @rooms = []  # Array of room objects
        @about = "~ An Experience Your Cat Wont Forget ~ \n The Purr Seasons is a luxury cat hotel. \n It's so good you'll wish you could stay too!"
    end

    # Displays the contact information for the hotel
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

    # adds a room to the hotel - pushes the room to the rooms array
    def add_room(room)
        @rooms << room
        return self
    end
    
    # menu to choose a room in the hotel to display further information
    def select_room

        # These two lines create an array for the menu to display the room names
        menu = []
        @rooms.each { |room| menu.push(room.type)} 

        # this displays the menu using the TTY-Prompt gem. It returns the selected room
        selection = TTY::Prompt.new.select("Choose a room type", menu, cycle: true, marker: '>', echo: false,)
            @rooms.each { |room| return room if room.type == selection }
    end

end

# TESTING

# hotel = Hotel.new
# hotel.add_room(Deluxe.new).add_room(Luxury.new)
# p hotel.select_room



