class ApplicationController < ActionController::Base
  include Pagy::Backend
  include SessionsHelper
  include UsersHelper
  include ReviewsHelper
  before_action :set_locale

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def logged_in_user
    return if logged_in?

    flash[:danger] = t "please_log_in"
    redirect_to login_url
  end
end
