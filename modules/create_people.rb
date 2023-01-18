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

  def select_role
    loop do
      puts 'Enter 1 for Student or 2 for Teacher'
      person_opt = gets.chomp
      case person_opt
      when '1'
        create_student
        break
      when '2'
        create_teacher
        break
      else
        puts 'Invalid option, please try again'
      end
    end
  end

  def create_student
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Classroom: '
    classroom = gets.chomp
    print 'Parent permission? [Y]ES or [N]O: '
    parent_permission = permission_given?
    id = Random.rand(1..1000)
    student = Student.new(id, classroom, age, name, parent_permission: parent_permission)
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
    id = Random.rand(1..1000)
    teacher = Teacher.new(id, specialization, age, name)
    @people.push(teacher)
    puts "Teacher #{teacher.name} added successfully"
  end
end
