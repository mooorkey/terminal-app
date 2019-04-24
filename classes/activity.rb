class Activity
    attr_reader :name

    def initialize(name, details, price)
        @name = name
        @details = details              # String
        @price = '%.2f' % price
    end

    def display_activity
        puts "Activity: #{@name}"
        puts "Price: $#{@price}"
        puts
        puts "Details: #{@details}"
    end

end

class Spa < Activity
    def initialize
        super("Cat Spa", "A gentle and relaxing paw massage", 22.45)
    end
end

class Catertainment < Activity
    def initialize
        super("Cat-ertainment Activity Centre", "A fun filled day of climbing and playing", 36.95)
    end
end

class Cafe < Activity
    def initialize
        super("Cat Cafe", "Delicious and lactose free kitty treats", 19.35)
    end
end

#TEST

# p Activity.new("Things", "Details", 20)
# p Catertainment.new
# p Spa.new
# cafe = Cafe.new
# puts cafe.display_activity