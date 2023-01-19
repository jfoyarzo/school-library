require 'json'
require_relative 'read_people'
require_relative 'read_books'
require_relative 'read_rentals'

module ReadData
  include ReadPeople
  include ReadBooks
  include ReadRentals

  def read_data
    read_people
    read_books
    read_rentals
  end
end
