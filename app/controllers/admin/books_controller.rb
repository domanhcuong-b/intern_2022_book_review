class Admin::BooksController < Admin::AdminController
  def index
    all_books = Book.order_by_time_created
                    .by_title(params[:search_text])
                    .by_genre(params[:genre_id])
    @pagy, @books = pagy all_books, items: Settings.book.BOOK_PER_PAGE
  end
end
