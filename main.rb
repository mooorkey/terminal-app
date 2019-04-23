require_relative './classes/hotel'
require_relative './classes/room'
require_relative './classes/cat'
require_relative './classes/booking'
require_relative './methods'

# Create a hotel and rooms
hotel = Hotel.new.add_room(Deluxe.new).add_room(Luxury.new)

# Welcome message
puts "Welcome to the Purr Seasons Cat Hotel"

# Enter Cat guest details
puts "Hello Human! Please enter your cat's name:"
cat_name = gets.chomp.capitalize

clear
puts "Meow #{cat_name}!"

# create a cat
cat = Cat.new(cat_name)

# Main Application Loop
currently_using = true

while currently_using

    # Display hotel menu options

    puts "How can we assist you today? Please select from the following options:"
    puts "(enter number or q to quit)"
    puts "1. Make a new booking"
    puts "2. View an existing booking"
    puts "3. View hotel room types"
    puts "4. View hotel information"
    puts "Q. to Quit"

    case gets.chomp

    # 1. Make a new booking
    when "1"
        clear

        # Display a list of room types
        hotel.display_rooms
        
        # Choose a room type
        room = hotel.choose_room    

        # Display room details
        clear
        room.display_room

        # Ask user if they want to book this room or view another
        # If user wants to book, display availability for user to select days
        # Or display room list for them to select another

        puts
        ##### THE FLOW ISN"T WORKING HERE... WILL HAVE TO RE THINK THE FLOW
        puts "Would you like to (b)ook this room or go back to the main menu?"      # or (v)iew another room type? <-- later
        case gets.chomp.downcase
        when "b", "book"
            clear
            booking_days = room.select_days
        when "v", "view"
            hotel.display_rooms
            hotel.choose_room
        else
            puts "something went wrong"
            room.display_room
        end

        # Create a new booking with room type and booking days
        booking = Booking.new(room, booking_days)
        cat.booking = booking

        # Display booking for user including price
        clear
        booking.display_booking

        # Option to return to main menu or quit
        any_key

    when "2"
        # View an existing booking
        # Dispaly booking for user
        # Stretch: provide option to cancel
        # Return to main menu or quit

    when "3"
        # View hotel room types
        # Display a list of room types
        # Choose a room type
        # Display details of room selected
        # Return to main menu or quit

    when "4"
        # View hotel information
        # Display hotel details
        # Return to main menu or quit
        
    when "q", "Q"
        # quit
    end



end



