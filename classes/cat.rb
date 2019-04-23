class Cat
    def initialize(name, age)
        @name = name
        @age = age
        @booking = nil
    end
end

# Testing

cat = Cat.new("Smokey", 4)
p cat