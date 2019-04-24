#---------------------------------------------------------------------------------------------------------------------
#                            PURR SEASONS CAT HOTEL
#                                  Terminal App
#
#                    Creatively and Lovingly Hand Crafted by
#                      Natalie Sargent and Carlie Hamilton
#                 for our Coder Academy - Ruby Terminal Assignment
#                   
#  Version 1.3
#  24 April 2019
#---------------------------------------------------------------------------------------------------------------------

require 'tty-prompt'
require_relative './classes/hotel'
require_relative './classes/room'
require_relative './classes/cat'
require_relative './classes/activity'
require_relative './classes/booking'
require_relative './methods/pretty'

# Create a hotel and rooms
hotel = Hotel.new.add_room(Deluxe.new).add_room(Luxury.new).add_room(Grey.new).add_activity(Spa.new).add_activity(Catertainment.new).add_activity(Cafe.new)

# Welcome message
clear
welcome(hotel)

# Enter Cat guest details
puts
puts "Hello Human!"
puts
puts "What is your cat's name please?"
puts

# Creating a cat - loop to make sure the user types in something
while true
    cat_name = gets.chomp.capitalize
    if cat_name != "" 
        clear
        break
    else
        puts "Ooops, please enter your cat's name:"
    end
end
cat = Cat.new(cat_name)
puts
puts "Meow #{cat.name}!"
puts

# Main Application Loop
while true
    
    # Display hotel menu options
    welcome(hotel)
    selection = TTY::Prompt.new.select("How may we assist you today? Please select from the following options:",  cycle: true, marker: '>', echo: false) do |menu|
        menu.choice('Make a new booking', 1)
        menu.choice('View an existing booking', 2)
        menu.choice('View hotel rooms', 3)
        menu.choice('View activites', 4)
        menu.choice('View hotel contact information', 5)
        menu.choice('Exit', 6)

        case selection

        # 1. Make a new booking
        when 1
            if cat.booking
                clear
                puts "You already have a booking! \n\n"
            else
                clear
                new_booking_header

                # Display list of room types and select a room
                room = hotel.select_room
                
                # Display room details
                clear
                new_booking_header
                room.display_room
                room.display_features
                puts
                booking_days = room.select_days

                # Create a new booking with room type and booking days
                cat.booking = Booking.new(room, booking_days)

                # Display booking for user including price
                clear
                puts "Thank you for your booking!"
                cat.booking.display_booking(cat)

                # Option to return to main menu or quit
                any_key
            end

        # View an existing booking
        when 2
            
            if cat.booking
                # View an existing booking
                clear
                cat.booking.display_booking(cat)

                # Return to main menu or quit
                any_key
            else
                clear
                puts "Ooops, sorry, you don't have a booking yet! \n\n"
            end

        # View hotel room types
        when 3
            clear
            view_rooms_header
            room = hotel.select_room
            
            # Display details of room selected
            clear
            room_name_header(room.type)
            room.display_room
            room.display_features
            room.display_availability

            # Return to main menu
            any_key

        # View Activities
        when 4
            clear

            menu = hotel.create_activity_menu
            selection = hotel.select_activity_single(menu)
            selection.display_activity(selection)
            any_key

        # View hotel contact information
        when 5
            clear
            hotel.contact_info

            # Return to main menu 
            any_key

        # Quit
        when 6
            if cat.booking
                clear
                puts "Thank you #{cat_name}!"
                puts "We look forward to welcoming you at the Purr Seasons on #{cat.booking.days[0]}."  # check this
                puts "Have a purr-fect day!"
                return
            else 
                clear
                puts "Thank you #{cat_name}"
                puts "We hope you will visit us soon!"
                puts "Have a purr-fect day"
                return
            end
        end
    end
end



