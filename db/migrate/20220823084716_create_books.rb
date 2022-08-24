class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :total_pages
      t.string :description
      t.decimal :average_rating
      t.boolean :lock_reviewing, default: false

      t.timestamps
    end
    add_index :books, :title
  end
end
