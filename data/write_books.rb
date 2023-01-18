module WriteBooks
  def write_books
    return if @books.empty?

    json = JSON.pretty_generate(@books.map do |book|
      {
        title: book.title,
        author: book.author
      }
    end)
    File.write('./json_files/books.json', json)

    puts 'Books saved to file successfully!'
  end
end
