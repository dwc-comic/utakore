class CreateTagMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_maps do |t|
      t.integer :item_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
