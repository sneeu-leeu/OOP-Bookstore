require_relative 'corrector'
require 'pry'

class Person
  attr_accsessor :name, :age
  attr_reader :id

  def initialize(age,  name = 'unknown', parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services
    true if of_age? || @parent_permission
  end

  def check_name
    correct = Corrector.new
    @name = correct.correct_name? @name
  end

  binding.pry
  private

  def of_age?
    @age >= 18
  end
end
