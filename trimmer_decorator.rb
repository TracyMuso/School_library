require_relative 'decorator'

clas TrimDecorator < Decorator
    def initialize(nameable)
        super()
        @nameable = nameable
    end

    def correct_name
        super.length > 10 ? super[0..9] : super
    end
end

person = Person.new(22, 'maximilianus')
  person.correct_name # => "maximilianus"
  capitalizedPerson = CapitalizeDecorator.new(person)
  capitalizedPerson.correct_name # => "Maximilianus"
  capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
  capitalizedTrimmedPerson.correct_name # => "Maximilian"
