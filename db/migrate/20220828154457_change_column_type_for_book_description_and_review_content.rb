class ChangeColumnTypeForBookDescriptionAndReviewContent < ActiveRecord::Migration[6.1]
  def change
    change_column :books, :description, :text
    change_column :reviews, :content, :text
  end
end
