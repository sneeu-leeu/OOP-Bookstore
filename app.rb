require_relative 'classroom'
require_relative 'display'
require_relative 'creator'
require_relative 'inoutput'

class App
  attr_accessor :people, :books, :displays, :rentals

  def initialize
    @people_file = InOutPut.new("people.json")
    @booksFile = InOutPut.new("books.json")
    @rentalsFile = InOutPut.new("rentals.json") 
    @people = []
    @books = []
    @rental = []
    @displays = Display.new(@books, @rental, @people)
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
      '7 - Exit'
    ]
    puts
  end

  def create_book
    new_rental = Creator.rental(@books, @people)
    @rentalsFile.write(new_rental.to_s)
    @rental << new_rental
  end

  def create_rental
    @rentalsFile.write(Creator.rental(@books, @people).to_s)
  end

  def create_person
    puts 'Do You Want To Create a Student (1) or a Teacher (2)'
    person_response = gets.chomp

    new_person = nil

    case person_response
    when '1'
      new_person = Creator.student
      @people_file.write(new_person.to_s)
      @people << new_person
    when '2'
      new_person = Creator.teacher
      @people_file.write(new_person.to_s)
      @people << new_person
    else
      puts 'Please Choose 1 - Student or 2 - Teacher'
    end
  end
end
