require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'classroom'

class App
  def initialize()
    @people = []
    @books = []
    @classrooms = []
  end

  def list_books
    puts
    @books.each { |book| puts "Author: #{book.author}, Title: #{book.title}" }
  end

  def list_people
    puts
    @people.each { |person| puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
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

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book added successfully'
  end

  def create_rental
    puts 'Select person by option number:'
    @people.each_with_index do |person, index|
      puts "#{index + 1} - Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    opt_person = gets.chomp.to_i - 1
    person = @people.at(opt_person)
    puts 'Select book by option number:'
    @books.each_with_index { |book, index| puts "#{index + 1} - Author: #{book.author}, Title: #{book.title}" }
    opt_book = gets.chomp.to_i - 1
    book = @books.at(opt_book)
    puts 'Enter date of rental: '
    date = gets.chomp
    person.add_rental(date, book)
    puts 'Rental created successfully'
  end

  def list_rentals_for_id(id)
    person = @people.find { |p| p.id == id }
    if person.rentals
      puts "-- Rentals for user #{person.name} (ID: #{person.id}) --"
      person.rentals.each_with_index do |element, index|
        puts "#{index + 1} - Date: #{element.date}, Book: #{element.book.title}"
      end
    else
      puts 'This user has no rentals'
    end
  end

  private

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
end

@app = App.new

def select_role
  loop do
    puts 'Enter 1 for Student or 2 for Teacher'
    person_opt = gets.chomp
    case person_opt
    when '1'
      @app.create_student
      break
    when '2'
      @app.create_teacher
      break
    else
      puts 'Invalid option, please try again'
    end
  end
end

def select_option(option)
  case option
  when '1'
    @app.list_books
  when '2'
    @app.list_people
  when '3'
    select_role
  when '4'
    @app.create_book
  when '5'
    @app.create_rental
  when '6'
    puts 'Enter the ID of the person:'
    id = gets.chomp.to_i
    @app.list_rentals_for_id(id)
  else
    puts 'Thank you for using this app, see you soon!'
    exit
  end
end

def main
  options = [
    'List all books',
    'List all people',
    'Create a person',
    'Create a book',
    'Create a rental',
    'List all rentals for a person\'s id',
    'Exit'
  ]
  puts 'Welcome, please select an option by entering the corresponding number: '
  options.each_with_index { |option, index| puts "#{index + 1} - #{option}" }
  selected_opt = gets.chomp
  select_option(selected_opt)
  puts
  puts 'Press Enter key to continue...'
  gets
  main
end

main
