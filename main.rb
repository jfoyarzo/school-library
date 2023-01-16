require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'classroom'
require_relative 'app'

class Main
  def initialize
    @app = App.new
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

  def run
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
    run
  end
end

main = Main.new
main.run
