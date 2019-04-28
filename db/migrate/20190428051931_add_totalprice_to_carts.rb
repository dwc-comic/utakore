class AddTotalpriceToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :totalprice, :integer
  end
end
