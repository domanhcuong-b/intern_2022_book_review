class CreateBooksGenresRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :books_genres_relationships do |t|
      t.integer :book_id
      t.integer :genre_id

      t.timestamps
    end
    add_index :books_genres_relationships, :book_id
    add_index :books_genres_relationships, :genre_id
    add_index :books_genres_relationships, [:book_id, :genre_id], unique: true
  end
end
