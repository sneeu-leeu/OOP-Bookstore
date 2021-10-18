require_relative 'classroom'
require_relative 'display'
require_relative 'creator'

class App
  attr_accessor :people, :books

  def initialize
    @people = []
    @books = []
    @rentals = []
    @displays = Display.new(@books, @rentals, @people)
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
    puts
    response = gets.chomp
    choose_action response
  end

  def choose_action(option) # rubocop:todo Metrics/CyclomaticComplexity
    case option
    when '1'
      @displays.books
    when '2'
      @displays.people
    when '3'
      create_person
    when '4'
      @books << Creator.book
    when '5'
      @rentals << Creator.rental(@books, @people)
    when '6'
      @displays.rentals
    when '7'
      puts 'Exit'
      return
    end
    menu
  end

  def create_person
    puts 'Do You Want To Create a Student (1) or a Teacher (2)'
    person_response = gets.chomp

    case person_response
    when '1'
      @people << Creator.student
    when '2'
      @people << Creator.teacher
    else
      puts 'Please Choose 1 - Student or 2 - Teacher'
    end
  end
end