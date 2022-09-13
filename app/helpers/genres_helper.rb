module GenresHelper
  def get_genres_for_filter
    Genre.order_by_name.pluck(:name, :id).unshift([t("select_genre"), nil])
  end
end
