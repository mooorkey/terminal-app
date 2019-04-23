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
puts
puts "Hello Human!"
puts "What is your cat's name?"
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
    puts "4. View hotel contact information"
    puts "Q. to Quit"

    case gets.chomp

    # 1. Make a new booking
    when "1"
        clear

        # Display list of room types and select a room
        room = hotel.select_room
        
        # Display room details
        clear
        room.display_room
        
        booking_days = room.select_days

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
        clear
        booking.display_booking

        # Return to main menu or quit
        any_key

    when "3"
        # View hotel room types
        clear
        room = hotel.select_room
        
        # Display details of room selected
        clear
        room.display_room

        # Return to main menu or quit
        any_key

    when "4"
        # View hotel contact information
        clear
        hotel.contact

        # Return to main menu or quit
        any_key
        
    when "q", "Q"
        # quit
        if cat.booking
            puts "Thank you #{cat_name}!"
            puts "We look forward to welcoming you on #{booking.days[0]}"  # check this
            currently_using = false
        else 
            puts "Thank you #{cat_name}"
            puts "We hope to see you soon"
            currently_using = false
        end
    end



end



