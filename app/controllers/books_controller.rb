class BooksController < ApplicationController
  before_action :find_book_by_id, only: :show

  def index
    @pagy, @books = pagy Book.order_by_time_created,
                         items: Settings.book.BOOK_PER_PAGE
  end

  def show; end

  private

  def find_book_by_id
    @book = Book.find_by id: params[:id]
    return if @book

    flash[:warning] = t ".book_not_found"
    redirect_to books_path
  end
end
