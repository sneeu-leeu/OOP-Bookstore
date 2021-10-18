require_relative 'classroom'
require_relative 'display'
require_relative 'creator'

class App
  attr_accessor :people, :books, :displays, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
    @displays = Display.new(@books, @rentals, @people)
  end

  def menu
    puts
    puts [
    'Please choose an option by entering a number',
    '1 - List All Books',
    '2 - List All People',
    '3 - Create a Person',
    '4 - Create a Book',
    '5 - Rent a Book',
    '6 - List All Rentals for a Given Person (requires id)',
    '7 - Exit']
    puts

  end
 
  def create_rental
    @rentals << Creator.rental(@books, @people)   
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