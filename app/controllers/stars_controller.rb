class StarsController < ApplicationController
  def index
    @current_rating = params[:rating]
    respond_to do |format|
      format.html{redirect_to root_path}
      format.js
    end
  end
end
