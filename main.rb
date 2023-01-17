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
    @app.select_option(selected_opt)
    puts
    puts 'Press Enter key to continue...'
    gets
    run
  end
end

main = Main.new
main.run
