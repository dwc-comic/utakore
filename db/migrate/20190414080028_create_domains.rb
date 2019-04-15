class CreateDomains < ActiveRecord::Migration[5.2]
  def change
    create_table :domains do |t|
      t.string :name
      t.integer :phone_number
      t.string :email
      t.integer :postal_code
      t.string :home_address
      t.string :password

      t.timestamps
    end
  end
end
