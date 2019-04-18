class AddKanaToAdmin < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :kana, :string
  end
end
