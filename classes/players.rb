class Player
    attr_reader :name
    def initialize(name)
        # @number = number
        @name = name
    end

    def to_s
        "##{name}"
    end
end
