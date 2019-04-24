require 'tty-prompt'
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
        @activities = [] #Array of activity objects
        @about = "~ An Experience Your Cat Wont Forget ~ \n The Purr Seasons is a luxury cat hotel. \n It's so good you'll wish you could stay too! \n\n All our rooms are heated to the purr-fect temperature,\n are fitted with cosy furnishings,\n include lots of cuddle time (if your cat likes that!),\n and are designed to make your cat feel at home. "
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

    # adds an activity to be available at the hotel (future enhancement - when there are multiple hotels, they may have different activities available)
    def add_activity(activity)
        @activities << activity
        return self
    end
    
    # menu to choose a room in the hotel
    def select_room

        # These two lines create an array for the menu to display the room names
        menu = []
        @rooms.each { |room| menu.push(room.type)} 

        # this displays the menu using the TTY-Prompt gem. It returns the selected room
        selection = TTY::Prompt.new.select("Choose a room type:", menu, cycle: true, marker: '>', echo: false)
            @rooms.each { |room| return room if room.type == selection }
    end

    # create menu for TTY-Prompt 
    def create_activity_menu
        # Create an array for the menu to display the activity names
        menu = []
        @activities.each { |activity| menu.push(activity.name)}
        return menu
    end

    # menu to select an activity
    def select_activity_single(menu)
        selection = TTY::Prompt.new.select("Choose an activity:", menu, cycle: true, marker: '>', echo: false)
            @activities.each { |activity| return activity if activity.name == selection }
    
    end

    # menu to select multipile activites
    def select_activity_multiple(menu)
        activities_selected = []
        TTY::Prompt.new.multi_select("Please select your actiities to book in:", menu, cycle: true, marker: '>', echo: false, per_page: 5).each do |activity|
            activities_selected.push[activity]
            return activities_selected
        end
    end

end

# TESTING

# hotel = Hotel.new
# hotel.add_room(Deluxe.new).add_room(Luxury.new).add_activity(Spa.new).add_activity(Cafe.new).add_activity(Catertainment.new)
# p hotel.activities
# p hotel.select_room
# p hotel.select_activity



