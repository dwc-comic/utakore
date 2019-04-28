class AddtotalPriceToCarts < ActiveRecord::Migration[5.2]
  def change
  	add_column :carts, :total_price, :integer
  end
end
