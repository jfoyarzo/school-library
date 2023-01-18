module WriteRentals
  def write_rentals
    # return if @rentals_json.empty?

    @people.each do |person|
      next if person.rentals.empty?

      rentals_new = person.rentals.map do |rental|
        {
          title: rental.book.title,
          author: rental.book.author,
          date: rental.date
        }
      end

      hash = {
        id: person.id,
        rentals: rentals_new
      }
      @rentals_json << hash
    end

    json = JSON.pretty_generate(@rentals_json)
    File.write('./json_files/rentals.json', json)

    puts 'Rentals saved to file successfully!'
  end
end
