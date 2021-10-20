require_relative 'classroom'
require_relative 'display'
require_relative 'creator'
require_relative 'inoutput'
require_relative 'convertor'

class App
  attr_accessor :people, :books, :displays, :rentals

  def initialize
    @peopleIO = InOutPut.new("people.json")
    @booksIO = InOutPut.new("books.json")
    @rentalsIO = InOutPut.new("rentals.json")

    @people = Convertor.people_h_to_ar @peopleIO.read
    @books = Convertor.hash_to_books_arr @booksIO.read
    @rental = Convertor.rentals_h_to_r @rentalsIO.read, @books, @people
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
    
    new_book = Creator.book
    @books << new_book
    @booksIO.write(new_book.to_hash)
  end

  def create_rental
    new_rental = Creator.rental(@books, @people)
    @rental << new_rental
    @rentalsIO.write(new_rental.to_hash)
  end

  def create_person
    puts 'Do You Want To Create a Student (1) or a Teacher (2)'
    person_response = gets.chomp

    new_person = nil

    case person_response
    when '1'
      new_person = Creator.student
      @peopleIO.write(new_person.to_hash)
      @people << new_person
    when '2'
      new_person = Creator.teacher
      @peopleIO.write(new_person.to_hash)
      @people << new_person
    else
      puts 'Please Choose 1 - Student or 2 - Teacher'
    end
  end
end
