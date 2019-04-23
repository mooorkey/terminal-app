require 'tty-prompt'

class Room
    attr_reader :type, :features, :price, :availability

    def initialize(type, features, price, availability)
        @type = type
        @features = features
        @price = '%.2f' % price
        @availability = availability
    end

    def display_room
        puts "Room Type: #{@type}"
        puts "Features: #{@features}"
        puts "Price: $#{@price}"
        puts "Availibilty:"
        @availability.each { |day, status| puts "    - #{day}: #{status}" }

        room_selection
    end

    def room_selection
        puts
        puts "Would you like to (b)ook this room or (v)iew another room type?"
        choice = gets.chomp.downcase
        if choice == "b" or choice == "book"
            select_days
        elsif choice == "v" or choice == "view"
            hotel.choose_room
        else
            puts "something went wrong"
            display_room
        end
    end

    # 1. Getting the available days
    # 2. Displaying a menu of the available days
    # 3. User selects the days and adds it to the booking
    def select_days
        days_menu = [ ]
        booking_days = []                 
        menu = TTY::Prompt.new

        # this gets the availability hash and formats it into the proper formatting 
        # for the gem TTY-Prompt - and adds it to the days_menu
        @availability.each do |day, status|
            if status != "Available"                                            # if not available, formats the day in this way
                days_menu.push({name: day.to_s, disabled: "Booked Out"})
            else                                                                # if is available, just sends the day
                days_menu.push(name: day.to_s)
            end
        end


        # User selects the days they want for their booking, and it changes the days to Booked
        menu.multi_select("Please select your days to book in:", days_menu, cycle: true, marker: '>', echo: false, per_page: 7).each do |day|
            @availability[day.to_sym] = "Booked"
        end
    end

    # def select_days
    #     @availability.each do |day, status|
    #         if status == "Available"
    #             puts day
    #         end
    #     end
    # end
end

class Deluxe < Room
    def initialize
        super("Deluxe", "features here", 300, {Monday: "Available", Tuesday: "Available", Wednesday: "Available", Thursday: "Available", Friday: "Available", Saturday: "Available", Sunday: "Available"})
    end
end

class Luxury < Room
    def initialize
        super("Luxury", "features here", 350, {Monday: "Available", Tuesday: "Available", Wednesday: "Available", Thursday: "Available", Friday: "Available", Saturday: "Booked Out", Sunday: "Booked Out"})
    end
end


# TEST

# single = Room.new("single", "feature here", 200, "everyday")
# p single

# deluxe = Deluxe.new
# p deluxe

# luxury = Luxury.new
# p luxury.select_days
# p luxury



