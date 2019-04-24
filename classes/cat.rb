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