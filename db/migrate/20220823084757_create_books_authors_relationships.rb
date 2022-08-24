class CreateBooksAuthorsRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :books_authors_relationships do |t|
      t.integer :book_id
      t.integer :author_id

      t.timestamps
    end
    add_index :books_authors_relationships, :book_id
    add_index :books_authors_relationships, :author_id
    add_index :books_authors_relationships, [:book_id, :author_id],
              unique: true
  end
end
