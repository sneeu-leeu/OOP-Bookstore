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

  # def choose_action(option)
  #   case option
  #   when '1'

  #   when '2'
  #   when '3'
  #   when '4'
  #   when '5'
  #   when '6'
  #   when '7'
  # end

end


