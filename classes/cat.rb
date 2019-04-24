# This is the main user class. It will hold the user's details and their booking. In future enhancements we would be able to hold additional information such as contact details, as well as multiple bookings and display past bookings. 
class Cat
    attr_accessor :booking, :name

    def initialize(name)
        @name = name
        # @age = age    # future extension - grab more details about the cat, and recommend a room, for instance, if cat is a certain age
        @booking = nil
    end
end

# Testing

# cat = Cat.new("Smokey", 4)
# p cat