class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def rent_out(date, person)
    Rental.new(date, person, self)
  end
end

# new_rental = Rental.new(date, person, self)
# @rentals << new_rental
