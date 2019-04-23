def clear
    puts "\e[2J\e[f"
end

def any_key
    puts "\n\n Press any key to go back to the main menu"
    $stdin.getch
    clear
end