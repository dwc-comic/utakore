class CartItem < ApplicationRecord
	belongs_to :cart
	belongs_to :item

	def total_price
		item.item_price * cart_quantity
	end
end
