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
end

def create_student
  print 'Age: '
  student_age = gets.chomp.to_i

  print 'Name: '
  student_name = gets.chomp

end


