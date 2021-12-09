class Player
    attr_accessor :name, :number
    def initialize(number, name)
        @number = number
        @name = name
    end

    def to_s
        "##{@number}: #{name}"
    end
end
