require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name = 'Unknown')
    super(name, age)
    @specialization = specialization
    @name = name
    @age = age
  end

  def can_use_services?
    true
  end
end
