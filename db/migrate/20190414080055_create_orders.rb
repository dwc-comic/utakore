class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :payment_id
      t.integer :total_price
      t.integer :shipping_postal_code
      t.string :shipping_home_address

      t.timestamps
    end
  end
end
