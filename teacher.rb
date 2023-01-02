require_relative 'person'

class Teacher < Person
  def initialize(specialization, age, name = 'Unknown', _parent_permission: true)
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
