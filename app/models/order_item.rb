class OrderItem < ApplicationRecord
	belongs_to :order
	belongs_to :item

	def total_price
		cart_item.item_price * ordered_quantity
	end
end
