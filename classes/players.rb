class Player
    attr_reader :name, :number, :position
    def initialize(name, number, position)
        @name = name
        @number = number
        @position = position
    end

    def to_s
        "Number: #{@number} | Name: #{@name} | Position: #{@position}"
    end
end
