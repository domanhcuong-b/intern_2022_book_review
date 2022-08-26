class BooksController < ApplicationController
  def index
    @pagy, @books = pagy Book.order_by_time_created,
                         items: Settings.book.BOOK_PER_PAGE
  end

  def show; end
end
