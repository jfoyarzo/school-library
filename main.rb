require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'classroom'

class App
  def initialize()
    @people = []
    @books = []
  end

  def list_books
    @books.each { |book| puts "Author: #{book.author}, Title: #{book.title}" }
  end

  def list_people
    @people.each { |person| puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_student
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Classroom: '
    classroom_label = gets.chomp
    classroom = Classroom.new(classroom_label)
    print 'Parent permission? [Y]ES or [N]O: '
    parent_permission = permission_given?
    student = Student.new(classroom, age, name, parent_permission: parent_permission)
    classroom.students.push(student)
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
        puts "#{index + 1} - Date: #{element.date}, Book: #{element.book}"
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

app = App.new
puts 'Create book'
app.create_book
app.create_book
puts 'Create person'
app.create_student
app.create_teacher
puts 'Create rental'
app.create_rental
puts 'list books'
app.list_books
puts 'list people'
app.list_people
