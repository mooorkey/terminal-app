# This is the main user class. It will hold the user's details and their booking. In future enhancements we would be able 
# to hold additional information such as contact details, as well as multiple bookings and display past bookings. 
# This class could also be used to store methods such as changing user contact details. 
class Cat
    attr_accessor :booking, :name

    def initialize(name)
        @name = name
        # @age = age    # future extension - grab more details about the cat, and recommend a room, for instance, if cat is a certain age
        @booking = nil  # booking is initialized as nil so that we can use the information in our main application loop, such as 
                        # a customized message upon exit. 
                        # Once a booking has been created, the booking object is added to this instance variable.
    end
end