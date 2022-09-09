class ReviewsController < ApplicationController
  before_action :logged_in_user, except: :index
  before_action :find_review_by_id, only: %i(edit update destroy)
  before_action :check_update_permission, only: %i(edit update)
  before_action :check_delete_permission, only: :destroy

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
    else
      flash[:danger] = t ".fail"
    end
    redirect_to book_path create_params[:book_id]
  end

  def edit
    respond_to do |format|
      format.html{redirect_to book_path @review.book_id}
      format.js
    end
  end

  def update
    if @review.update review_params
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".fail"
    end
    redirect_to book_path @review.book_id
  end

  def destroy
    if @review.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".fail"
    end
    redirect_to book_path @review.book_id
  end

  private

  def review_params
    params.require(:review).permit(Review::CREATEABLE_ATTRS)
  end

  def check_delete_permission
    return @review if can_delete_review? @review

    flash[:danger] = t ".not_allow_delete"
    redirect_to book_path @review.book_id
  end

  def check_update_permission
    return @review if can_update_review? @review

    flash[:danger] = t ".not_allow_update"
    redirect_to book_path @review.book_id
  end

  def find_review_by_id
    @review = Review.find_by id: params[:id]
    return if @review

    flash[:warning] = t ".review_not_found"
    redirect_to root_path
  end
end
