require 'json'

module ReadBooks
  def read_books
    return [] unless File.exist?('./json_files/books.json') && !File.empty?('./json_files/books.json')

    json = File.read('./json_files/books.json')
    parsed = JSON.parse(json)
    array = []
    parsed.each do |book|
      book_new = Book.new(book['title'], book['author'])
      array << book_new
    end
    array
  end
end
