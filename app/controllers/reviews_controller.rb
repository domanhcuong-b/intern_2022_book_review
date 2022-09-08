class ReviewsController < ApplicationController
  def index
    book_id = params[:book_id]
    @reviews = Review.by_book_id(book_id).by_rating(params[:rating])
                     .order_by_time_created
    respond_to do |format|
      format.html{redirect_to book_path book_id}
      format.js
    end
  end
end
