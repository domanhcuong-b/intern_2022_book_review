class FollowingController < ApplicationController
  before_action :find_user_by_params_id, only: :index

  def index
    @title = t "following"
    @pagy, @users = pagy @user.following, items: Settings.follow.USER_PER_PAGE
    render "users/show_follow"
  end
end
