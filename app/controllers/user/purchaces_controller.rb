class User::PurchacesController < User::Base
  def index
  	p current_user
  	@user = current_user
    @cart = Cart.find_by(user_id: @user.id)
    # @cart_items = CartItem.where(cart_id: @cart)
  end

  def create
  	carts = current_user.carts.where(deleted_at: nil)
  	order = Orders.new
  	carts.each do |cart|
  		order.cart_id = cart.id
  		order.user_id = current_user.id
  		#合計金額をOrderに追加したい
  		#order.total_price = cart.total_price(cart)
  		order.name = current_user.name
  		order.postal_code = current_user.postal_code
  		order.home_address = current_user.home_address
  		order.save
  	end
  	redirect_to user_purchaces_show_path
  end
end

