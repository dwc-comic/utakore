class User::PurchacesController < User::Base
  def index
  	p current_user
  	@user = current_user
    @cart = Cart.find_by(user_id: @user.id)
    # @cart_items = CartItem.where(cart_id: @cart)
  end

  def buy
  	carts = current_user.carts.where(deleted_at: nil)
  	order = Order.new
  	#binding.pay
  	carts.each do |cart|
  		cart.destroy
  		order.cart_id = cart.id
  		order.user_id = current_user.id
  		order.save
  	end
  	redirect_to purchace_show_path
  end
end
