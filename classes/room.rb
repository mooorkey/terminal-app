require 'tty-prompt'

# The Room class holds the features, price and availability of each room type. Room types are defined as sub classes. 
class Room
    attr_reader :type, :features, :price, :availability

    def initialize(type, features, price, availability)
        @type = type
        @features = features                # array of features - we could use this in a future enhancement to be able to search by feature. Also makes styling it easy with an each loop for display purposes (and this data is mainly to display to the user). 
        @price = '%.2f' % price
        @availability = availability        # hash of availability. i.e. Monday: "Available" - This is easy to see what day has what kind of availibily. 
    end

    # displays the room type and it's price
    def display_room
        puts "Room Type: #{@type}"
        puts "Price: $#{@price} per night"
    end
    
    # displays a room's features
    def display_features
        puts
        puts "Features:"
        @features.each { |feature| puts "       * #{feature}"}
    end

    # displays the room's availability
    def display_availability
        puts
        puts "Availability:"
        @availability.each { |day, status| puts "       * #{day}: #{status}"}
    end

    # selects the days for a booking, based on room's availability
    # the method for selcting the days has been split into several methods so that each method has an individual & specific purpose. 
    def select_days
        days_menu = []
        days_selected = []
        select_days_menu(days_menu)
        select_days_selection(days_selected, days_menu)
        return days_selected
    end

    # takes the room's availability and formats it for the TTY-Prompt gem - so that we can have a pretty options menu
    def select_days_menu(days_menu)
        @availability.each do |day, status|
            if status != "Available"                                           
                days_menu.push({name: day.to_s, disabled: "Booked Out"})    # if day is not available, formats the day in this way
            else                                                                
                days_menu.push(name: day.to_s)                              # if the day is available, just sends the day
            end
        end
    end

    # user selects the days they would like for their booking, based on the room's availability
    def select_days_selection(days_selected, days_menu)
        TTY::Prompt.new.multi_select("Please select the days you would like to stay:", days_menu, cycle: true, marker: '>', echo: false, per_page: 7).each do |day|
            @availability[day.to_sym] = "Booked Out"
            days_selected.push(day)
        end
    end
end

class Deluxe < Room
    def initialize
        super("Deluxe", ["Two story scratching post", "Plush bedding", "Self-filling bubbling water", "Wide range of jingly toys", "All meals included"], 300, {Monday: "Available", Tuesday: "Available", Wednesday: "Available", Thursday: "Available", Friday: "Available", Saturday: "Available", Sunday: "Available"})
    end
end

class Luxury < Room
    def initialize
        super("Luxury", ["Three story scratching post", "Ultra plush bedding", "Self-filling bubbling water", "Wide range of jingly toys", "Daily cat massage", "Ocean views", "All meals included"], 350, {Monday: "Available", Tuesday: "Available", Wednesday: "Available", Thursday: "Available", Friday: "Available", Saturday: "Booked Out", Sunday: "Booked Out"})
    end
end

class Grey < Room
    def initialize
        super("Grey Nomad", ["Perfect for older cats", "Ground level scratching post", "Plush bedding", "Quiet position", "Special diet for mature tastes"], 270, {Monday: "Available", Tuesday: "Available", Wednesday: "Booked Out", Thursday: "Booked Out", Friday: "Available", Saturday: "Available", Sunday: "Available"})
    end
end

# TEST

# single = Room.new("single", "feature here", 200, "everyday")
# p single

# deluxe = Deluxe.new
# p deluxe

# luxury = Luxury.new
# p luxury.select_days




