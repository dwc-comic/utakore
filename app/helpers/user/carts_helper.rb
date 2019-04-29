module User::CartsHelper
	def add_item(_cart, _item, _quantity)
		#引数のクラス
		#_itemはItemクラスのオブジェクト
		#_cartはCartクラスのオブジェクト
		#_quantityはIntegerクラスのオブジェクト

		# if _cart.cart_items.find_by(item_id: _item.id).present?
		# 	#すでに商品が存在した場合、既存のレコードのquantityカラムの内容を増加させす処理
		# 	cart_item = cart.cart_items.find(item.id)
		# 	cart_item.update(quantity: _quantity + cart_item.quantity)
		# else
			#商品が存在しない場合新規にレコード追加する処理
			CartItem.create(cart_id: _cart.id, item_id: _item.id, cart_quantity: _quantity)
		# end
	end

	def create_cart(_user)
		#_userはUserクラスのオブジェクト
	  cart = Cart.new
      cart.user_id = current_user.id
      cart.save
	end

	def get_total_price(_cart_items)
		#_cart_itemsはCartItemクラスの配列オブジェクト
		return _cart_items.pluck(:quantity).sum
	end
end
