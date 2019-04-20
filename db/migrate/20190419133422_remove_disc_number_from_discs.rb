class RemoveDiscNumberFromDiscs < ActiveRecord::Migration[5.2]
  def change
    remove_column :discs, :discNumber, :string
  end
end
