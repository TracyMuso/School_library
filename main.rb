require_relative 'app'

class Main
  def initialize
    @app = App.new
    @output = 0
  end

  def options
    puts 'Welcome to the School Library App!'
    while @output != 7
      puts 'Please choose an option by entering a number: '
      puts '1 - List all books'
      puts '2 - List all people'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person id'
      puts '7 - Exit'
      start
    end
  end

  def start
    @output = gets.chomp.to_i
    case @output
    when 1
      @app.list_books
    when 2
      @app.list_people
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_rentals_for_person_id
    when 7
      puts 'Thank you for using this app!'
    else
      puts 'That is not a valid option'
    end
  end
end

main = Main.new
main.options
