module ReviewsHelper
  def make_statistic rating, reviews
    number_of_review = reviews.by_rating(rating).count
    html = "<div class=\"statistic\">"
    html << "( <span class=\"bold green\">#{number_of_review}</span> ) "
    html << "<i class=\"fa-solid fa-star\"></i> " * rating
    html << "<i class=\"fa-regular fa-star\">
      </i> " * (Settings.book.MAX_RATING - rating)
    html << "<input type=\"hidden\" name=\"rating\" id=\"rating\"
      value=\"#{rating}\">"
    html << "</div>"
    html
  end
end
