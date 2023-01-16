module CreatePeople
  def permission_given?
    parent_permission = true
    loop do
      option = gets.chomp.upcase!
      case option
      when 'Y'
        break
      when 'N'
        parent_permission = false
        break
      else
        puts 'Please enter a valid option'
      end
    end
    parent_permission
  end

  def create_student
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Classroom: '
    classroom_label = gets.chomp
    classroom = @classrooms.find { |element| element.label == classroom_label }
    unless classroom
      classroom = Classroom.new(classroom_label)
      @classrooms << classroom
    end
    print 'Parent permission? [Y]ES or [N]O: '
    parent_permission = permission_given?
    student = Student.new(classroom, age, name, parent_permission: parent_permission)
    classroom.add_student(student)
    @people.push(student)
    puts "Student #{student.name} added successfully"
  end

  def create_teacher
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name)
    @people.push(teacher)
    puts "Teacher #{teacher.name} added successfully"
  end
end
