class Order < ApplicationRecord
	belongs_to :user
	belongs_to :cart
	has_many :order_items, dependent: :destroy
	has_many :items, through: :order_items, dependent: :destroy

	def add_cart_item(cart_item_id)

		current_cart_item = order_items.find_bycaet_item_id(item_id)

		if current_cart_item
			current_cart_item.quantity += 1
		else
			current_cart_item = order_items.build(item_id: item_id)
		end
		current_cart_item

	end

	def total_price(cart)
		order.order_items.to_a.sum { |item| item.total_price }
	end
end
