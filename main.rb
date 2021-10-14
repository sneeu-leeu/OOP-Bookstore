require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

class App
  attr_accessor :people, :books

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def execute
    puts 'Welcome To The School Library App'
    menu
  end

  def menu
    puts
    puts 'Please choose an option by entering a number'
    puts '1 - List All Books'
    puts '2 - List All People'
    puts '3 - Create a Person'
    puts '4 - Create a Book'
    puts '5 - Rent a Book'
    puts '6 - List All Rentals for a Given Person (requires id)'
    puts '7 - Exit'
    response = gets.chomp
    choose_action response
  end

  def choose_action(option)
    case option
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals_by_id
    when '7'
      puts 'Exit'
  end

  def list_books
    @books.each { |book| puts 'Title: #{book.title}, Author: #{book.author}' }
    menu
  end

  def list_people
    @people.each { |person| puts '[#{class}] Name: #{person.name}, ID: #{person.id}, Age:#{person.age}'}
    menu
  end

  def create_person
    puts 'Do You Want To Create a Student (1) or a Teacher (2)'
    person_response = gets.chomp

    case person_response
    when '1'
      create_person
    when '2'
      create_teacher
    else
      puts 'Please Choose 1 - Student or 2 - Teacher'
  end

  def create_student
    print 'Age: '
    age_response = gets.chomp.to_i

    print 'Name: '
    name_response = gets.chomp

    print 'Has Parent Permission? [Y/N]'
    permission_response = gets.chomp.downcase == y

    student = Student.new(age: age_response, name: name_response, parent_permission: permission_response, classroom: @classroom)
    @people << student

    puts "Person #{student_name} created"

    choose_action
  end

  def create_teacher
    print 'Age: '
    age_response = gets.chomp.to_i

    print 'Name: '
    name_response = gets.chomp

    print 'Specialization'
    specialization_response = gets.chomp

    teacher = Teacher.new(age: age_response, name: name_response, specialization: specialization_response)

    @people << teacher

    puts "Teacher #{teacher.name} created successfully"
    choose_action
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)

    @books << book

    puts "book: #{book.tile} created successfully"
    choose_action
  end

  def create_rental
    puts 'Select a Book from the Following list by number'
    @books.each_with_index { |book, i| puts "#{i} Title: #{book.title}, Author: #{book.author}" }

    book_i = gets.chomp.to_i

    puts 'Select a Person from the following list by number (NOT ID)'
    @people.each_with_index { |person, i| puts "#{i} Name: #{person.name}, Age: #{person.age}" }

    person_i = gets.chomp.to_i

    puts 
    print "Date: "
    date = gets.chomp

    rental = Rental.new(date, @books[book_i], @people[person_i])

    @rental << rental

    puts "Book #{@books[book_i]} rented successfully by #{@people[person_i]}"

    choose_action
  end

  def list_rentals_by_id
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals: '

    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" if rental.person.id == id
    end

    choose_action
  end
end

def main 
  app = App.new
  app.run
end

main