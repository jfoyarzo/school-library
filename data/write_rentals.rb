module WriteRentals
  def write_rentals

    @people.each do |person|
      next if person.rentals.empty?
      existing_hash = @rentals_json.find { |hash| hash['id'] == person.id }
      rentals_new = person.rentals.map do |rental|
        {
          title: rental.book.title,
          author: rental.book.author,
          date: rental.date
        }
      end
      if existing_hash
        existing_hash['rentals'] = rentals_new
      else 
        hash = {
          id: person.id,
          rentals: rentals_new
        }
        @rentals_json << hash
      end
    end

    json = JSON.pretty_generate(@rentals_json)
    File.write('./json_files/rentals.json', json)

    puts 'Rentals saved to file successfully!'
  end
end
