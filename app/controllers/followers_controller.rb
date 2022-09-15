class FollowersController < ApplicationController
  before_action :find_user_by_params_id, only: :index

  def index
    @title = t "followers"
    @pagy, @users = pagy @user.followers, items: Settings.follow.USER_PER_PAGE
    render "users/show_follow"
  end
end
