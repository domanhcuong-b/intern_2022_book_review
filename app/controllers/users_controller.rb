class UsersController < ApplicationController
  before_action :find_user_by_params_id, only: :show

  def show
    @all_reviews = Review.by_user_id(@user.id).order_by_time_created
    @pagy, @reviews = pagy @all_reviews,
                           items: Settings.review.REVIEW_PER_PAGE
  end

  private

  def find_user_by_params_id
    @user = User.find_by id: params[:id]
    return if @user

    flash[:warning] = t "users.user_not_found"
    redirect_to root_path
  end
end
