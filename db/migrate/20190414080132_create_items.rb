class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.string :image_id
      t.string :artist_name
      t.string :lebel
      t.string :genre
      t.integer :item_price
      t.integer :stock

      t.timestamps
    end
  end
end
