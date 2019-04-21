class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :cart_id
      t.integer :item_id
      t.integer :cart_quantity :hoge, default: 0

      t.timestamps
    end
  end
end
