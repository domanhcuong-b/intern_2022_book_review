class BooksController < ApplicationController
  include GenresHelper

  before_action :find_book_by_id, only: :show

  def index
    all_books = Book.order_by_time_created
                    .by_title(params[:search_text])
                    .by_genre(params[:genre_id])
    @pagy, @books = pagy all_books, items: Settings.book.BOOK_PER_PAGE
  end

  def show
    @review = Review.new
    @reviews_of_book = Review.by_book_id(@book.id).order_by_time_created
    @pagy, @reviews = pagy @reviews_of_book,
                           items: Settings.review.REVIEW_PER_PAGE
  end

  private

  def find_book_by_id
    @book = Book.find_by id: params[:id]
    return if @book

    flash[:warning] = t ".book_not_found"
    redirect_to books_path
  end
end
