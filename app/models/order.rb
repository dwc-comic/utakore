class Order < ApplicationRecord
	belongs_to :user
	has_many :order_items, dependent: :destroy
	has_many :cart_items, through: :cert
end
