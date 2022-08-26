module BooksHelper
  def get_authors_name book
    name_array = []
    book.authors.each{|author| name_array << author.name}
    name_array.join(", ")
  end
end
