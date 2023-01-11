require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  def initialize()
    @people = []
    @books = []
  end

  def list_books
    @books.each { |book| puts "Author: #{book.author}, Title: #{book.title}" }
  end

  def list_people
    @people.each { |person| puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_student
    print 'Name:'
    name = gets.chomp
    print 'Age:'
    age = gets.chomp
    print 'Classroom:'
    classroom = gets.chomp
    print 'Parent permission? [Y]ES or [N]O:'
    parent_permission = permission_given?
    student = Student.new(classroom, age, name, parent_permission: parent_permission)
    p student
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
app.create_student
