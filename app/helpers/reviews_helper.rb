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

  def make_star_rating rating
    html = ""
    Settings.book.MAX_RATING.times do |n|
      html << if n + 1 <= rating.to_i
                "<div class=\"rating-star\" data-value=#{n + 1}>
          <i class=\"fa-solid fa-star\"></i> </div>"
              else
                "<div class=\"rating-star\" data-value=#{n + 1}>
          <i class=\"fa-regular fa-star\"></i> </div>"
              end
    end
    html
  end

  def get_time_create review
    review.created_at.in_time_zone(Settings.time_zone)
          .strftime("%H:%M %Y-%m-%d")
  end
end
