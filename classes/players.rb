class Player
    attr_accessor :name
    def initialize(name)
        # @number = number
        @name = name
    end

    def to_s
        "##{name}"
    end
end
