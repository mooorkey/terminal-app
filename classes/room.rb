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
    end

    def 

    end
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
# luxury.display_room

