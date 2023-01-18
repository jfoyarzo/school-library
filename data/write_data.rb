require 'json'
require_relative 'write_books'
require_relative 'write_people'
require_relative 'write_rentals'

module WriteData
  include WriteBooks
  include WritePeople
  include WriteRentals
  
  def write_data
    write_books
    write_people
    write_rentals
  end
end
