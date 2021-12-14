class Player
    attr_reader :name, :number
    def initialize(name, number)
        @name = name
        @number = number
    end

    def to_s
        "Number: #{@number} | Name: #{@name}"
    end

    def player_name
        "#{@name}"
    end
end
