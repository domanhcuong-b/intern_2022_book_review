module GenresHelper
  def get_genres_for_filter
    result = [[t("select_genre"), nil]]
    genres = Genre.order_by_name
    genres.map{|genre| result.push([genre.name, genre.id])}
    result
  end
end
