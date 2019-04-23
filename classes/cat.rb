class Cat
    def initialize(name, age)
        @name = name
        @age = age
        @booking = false
    end
end

# Testing

cat = Cat.new("Smokey", 4)
p cat