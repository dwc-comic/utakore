class Cart < ApplicationRecord
	belongs_to :user
	has_many :cart_items
	has_many :item, through: :cart_items, dependent: :destroy


end
