require_relative 'corrector'

class Person
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age:, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..100)
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

  def to_s
    [
      @name,
      @age,
      @id
    ]
  end

  private

  def of_age?
    @age >= 18
  end
end
