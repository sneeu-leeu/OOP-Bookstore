require_relative 'corrector'

class Person
  attr_accessor :name, :age, :rentals, :id

  def initialize(age:, name: 'Unknown', parent_permission: true, id: 0)
    @id = id.eql?(0) ? Random.rand(1..100) : id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    true if of_age? || @parent_permission
  end

  def check_name
    correct = Corrector.new
    @name = correct.correct_name @name
  end

  private

  def of_age?
    @age >= 18
  end
end
