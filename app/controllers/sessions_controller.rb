class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate params[:session][:password]
      handle_valid_authenticate user
    else
      handle_invalid_authenticate
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private
  def handle_invalid_authenticate
    flash[:danger] = t ".login_fail"
    render :new
  end

  def handle_valid_authenticate user
    log_in user
    params[:session][:remember_me] == "1" ? remember(user) : forget(user)
    flash[:success] = t ".login_success"
    return redirect_to admin_root_path if user.admin?

    redirect_to root_url
  end
end
