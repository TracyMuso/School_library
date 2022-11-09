require_relative 'nameable'

class CapitalizeDecorator < Decorator

    def initialize(nameable)
        super()
        @nameable = nameable
    end
    
    def correct_name
        super.capitalize
    end
end
