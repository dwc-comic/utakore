class AddDiscNumberToDiscs < ActiveRecord::Migration[5.2]
  def change
    add_column :discs, :discNumber, :string
  end
end
