class StaticPagesController < ApplicationController
  def home
    return unless logged_in?

    @pagy, @feed_items = pagy current_user.feed,
                              items: Settings.review.REVIEW_PER_PAGE
  end
end
