class Admin::AdminController < ApplicationController
  layout "admin/layouts/application_admin"
  before_action :is_admin?

  private

  def is_admin?
    return current_user&.admin?

    redirect_to root_path
  end
end
