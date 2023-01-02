class Person
  def initialize(age, name = 'Unknown', _parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
  end

  attr_reader :id
  attr_accessor :name, :age

  def can_use_services?
    is_of_age? || _parent_permission
  end

  private

  def is_of_age?
    @age > 18
  end
end