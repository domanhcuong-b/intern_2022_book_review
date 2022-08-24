class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :book_id
      t.integer :user_id
      t.string :content
      t.integer :rating

      t.timestamps
    end
    add_index :reviews, :book_id
    add_index :reviews, :user_id
    add_index :reviews, [:book_id, :user_id], unique: true
  end
end
