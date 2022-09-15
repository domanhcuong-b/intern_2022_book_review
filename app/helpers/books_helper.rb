module BooksHelper
  def get_authors_name book
    return t "updating" if book.authors.blank?

    name_array = []
    book.authors.each{|author| name_array << author.name}
    name_array.join(", ")
  end

  def get_genres_name book
    return t "updating" if book.genres.blank?

    name_array = []
    book.genres.each{|genre| name_array << genre.name}
    name_array.join(", ")
  end

  def get_cover_url book
    return "cover_default.png" unless book.picture

    book.picture_url.url
  end

  def get_average_rating book
    return t "no_review" unless book.average_rating

    "#{book.average_rating} / 5.0"
  end

  def get_total_pages book
    return t "updating" unless book.total_pages

    book.total_pages
  end

  def find_book_by_id
    @book = Book.find_by id: params[:id]
    return if @book

    flash[:warning] = t "books.book_not_found"
    redirect_to books_path
  end
end
