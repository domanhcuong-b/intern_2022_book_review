class CreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.integer :ownership_id
      t.string :ownership_type
      t.string :url

      t.timestamps
    end
    add_index :pictures, [:ownership_id, :ownership_type], unique: true
  end
end
