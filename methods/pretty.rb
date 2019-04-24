# Line for the headers
HEADER_LINE = "--------------------------------------------------------------"
HEADER_LENGTH = HEADER_LINE.length

# clears the screen
def clear
    puts "\e[2J\e[f"
end

# Returns user to the main menu
def any_key
    puts "\n\n Press any key to go back to the main menu"
    $stdin.getch
    clear
end

# SOME PRETTY HEADERS FOR OUR MAIN APP

# Welcome to the app & hotel
def welcome(hotel)
    puts HEADER_LINE
    puts "WELCOME TO THE".center(HEADER_LENGTH)
    puts "#{hotel.name} Hotel!".center(HEADER_LENGTH)
    puts HEADER_LINE
end

# header for when placing a new booking
def new_booking_header
    clear
    puts HEADER_LINE
    puts "Create a new booking right meow!".upcase.center(HEADER_LENGTH)
    puts HEADER_LINE
end

# header for when selecting rooms to view
def view_rooms_header
    clear
    puts HEADER_LINE
    puts "View Rooms".upcase.center(HEADER_LENGTH)
    puts HEADER_LINE
end

# header for when viewing selected room
def room_name_header(room_name)
    clear
    puts HEADER_LINE
    puts "#{room_name} Room".upcase.center(HEADER_LENGTH)
    puts HEADER_LINE
end

# header for selecting activities to view
def activity_selection_header
    clear
    puts HEADER_LINE
    puts "Select an activity".upcase.center(HEADER_LENGTH)
    puts HEADER_LINE
end

# header for when viewing activities
def activity_header(activity_name)
    clear
    puts HEADER_LINE
    puts "Activity: #{activity_name}".upcase.center(HEADER_LENGTH)
    puts HEADER_LINE
end