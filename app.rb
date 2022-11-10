require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'classroom'
require_relative 'person'

class App
  attr_accessor :books, :teachers, :students, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    @books.each_with_index { |book, index| print "(#{index}) Title: \"#{book.title}\", Author: \"#{book.author}\"\n" }
  end

  def list_people
    @people.each_with_index do |person, index|
      print "(#{index} Name: \"#{person.name}\", ID: \"#{person.id}\", Age: \"#{person.age}\"\n"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp

    case person_type
    when '1'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Enter classroom: '
      classroom = gets.chomp
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp.downcase == 'y'
      create_student(name, age, parent_permission, classroom)
    when '2'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp
      create_teacher(name, age, specialization)
    else
      puts 'Invalid option'
      return
    end

    puts 'Person created successfully'
  end

  def create_student(name, age, parent_permission, classroom)
    classroom = Classroom.new(classroom)
    student = Student.new(classroom, age, name, parent_permission: parent_permission)
    @people.push(student)
  end

  def create_teacher(name, age, specialization)
    teacher = Teacher.new(age, specialization, name)
    @people.push(teacher)
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    book_ = Book.new(title, author)
    @books.push(book_)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number (not id)'
    list_books
    select_book = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    list_people
    select_person = gets.chomp.to_i
    puts 'Enter Date: '
    date = gets.chomp
    book = @books[select_book]
    person = @people[select_person]
    book_rental = Rental.new(date, person, book)
    @rentals.push(book_rental)
    puts 'Rental created successfully'
  end

  def list_rentals_for_person_id
    print 'ID of person: '
    id = gets.chomp.to_i
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
  end
end
