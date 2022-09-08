class ChangeColumnTypeForBookAverageRating < ActiveRecord::Migration[6.1]
  def change
    change_column :books, :average_rating, :float
  end
end
