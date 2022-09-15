class BooksController < ApplicationController
  include GenresHelper

  before_action :find_book_by_id, only: :show

  def index
    @all_books = Book.order_by_time_created
    if params[:search_text].present?
      @all_books = @all_books.by_title(params[:search_text])
    end
    if params[:genre_id].present?
      @all_books = @all_books.joins(:genres)
                             .where(genres: {id: params[:genre_id]})
    end
    @pagy, @books = pagy @all_books, items: Settings.book.BOOK_PER_PAGE
  end

  def show
    @review = Review.new
    @reviews_of_book = Review.by_book_id(@book.id).order_by_time_created
    @pagy, @reviews = pagy @reviews_of_book,
                           items: Settings.review.REVIEW_PER_PAGE
  end
end
