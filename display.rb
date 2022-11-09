person = Person.new(22, 'maximilianus')
person.correct_name # => "maximilianus"
capitalized_person = CapitalizeDecorator.new(person)
capitalized_person.correct_name # => "Maximilianus"
capitalized_trimmed_person = TrimDecorator.new(capitalizedPerson)
capitalized_trimmed_person.correct_name # => "Maximilian"
