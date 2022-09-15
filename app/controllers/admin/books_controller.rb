class Admin::BooksController < Admin::AdminController
  before_action :find_book_by_id, only: %i(destroy edit update)

  def index
    all_books = Book.order_by_time_created
                    .by_title(params[:search_text])
                    .by_genre(params[:genre_id])
    @pagy, @books = pagy all_books, items: Settings.book.BOOK_PER_PAGE
  end

  def new
    @book = Book.new
    @author = @book.authors.build
    @genre = @book.genres.build
    @book.build_picture
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = t ".create_success"
    else
      flash[:danger] = t ".create_fail"
    end
    redirect_to admin_books_path
  end

  def edit; end

  def update
    if @book.update book_params
      flash[:success] = "success"
    else
      flash[:danger] = "fail"
    end
    redirect_to admin_books_path
  end

  def destroy
    if @book.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".fail"
    end
    redirect_to admin_books_path
  end

  private

  def book_params
    params.require(:book).permit(Book::BOOK_PARAMS)
  end
end
