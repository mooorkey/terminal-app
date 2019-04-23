HEADER_LINE = "--------------------------------------------------------------"
HEADER_LENGTH = HEADER_LINE.length

def clear
    puts "\e[2J\e[f"
end

def any_key
    puts "\n\n Press any key to go back to the main menu"
    $stdin.getch
    clear
end

def new_booking_header
    puts HEADER_LINE
    puts "New Booking".upcase.center(HEADER_LENGTH)
    puts HEADER_LINE
end

def view_rooms_header
    puts HEADER_LINE
    puts "View Rooms".upcase.center(HEADER_LENGTH)
    puts HEADER_LINE
end

def room_name_header(name)
    puts HEADER_LINE
    puts "#{name} Room".upcase.center(HEADER_LENGTH)
    puts HEADER_LINE
end
