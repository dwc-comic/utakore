class User::OrdersController < User::Base

  def index
  	@user = current_user
    @cart = Cart.find_by(user_id: @user.id)
    # @cart_items = CartItem.where(cart_id: @cart)
  end

  def show
  end
end


