class Person
  attr_accsessor :name, :age
  attr_reader :id

  def initialize(name: 'unknown', age:, parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services
    true if is_of_age? || @parent_permission
  end

  private

  def of_age(_person)
    @age >= 18
  end
end
