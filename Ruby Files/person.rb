require '../corrector'

class Person
  attr_accsessor :name, :age
  attr_reader :id

  def initialize(age:, parent_permission: true, name: 'unknown')
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services
    true if is_of_age? || @parent_permission
  end

  def check_name
    correct = corrector.new
    @name = correct.correct_name? @name
  end

  private

  def of_age(_person)
    @age >= 18
  end
end
