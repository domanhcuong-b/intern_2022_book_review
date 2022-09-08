class ReviewsController < ApplicationController
  before_action :logged_in_user, only: :create


  def index
    book_id = params[:book_id]
    @reviews = Review.by_book_id(book_id).by_rating(params[:rating])
                     .order_by_time_created
    respond_to do |format|
      format.html{redirect_to book_path book_id}
      format.js
    end
  end

  def create
    create_params = review_params
    create_params[:user_id] = current_user.id
    @review = Review.new create_params
    if @review.save
      flash[:success] = t ".success"
      redirect_to books_path
    else
      flash[:danger] = t ".fail"
      redirect_to root_path
    end
  end

  private

  def review_params
    params.require(:review).permit(Review::CREATEABLE_ATTRS)
  end
end
