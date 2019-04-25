class User::CartsController < User::Base

before_action :setup_cart_items!, only: [:add_items, :update_items, :delete_items]

def index
    @user = current_user
    @cart = Cart.find_by(user_id: @user.id)
    # @cart_items = CartItem.where(cart_id: @cart)
    order = Order.new
end


def new

    @cart_item = Cart_item.new

end

def create
   order = Order.new
   @cart = Cart.new
   @cart.user_id = current_user.id
   @cart.save

   @cart_item = CartItem.new
   @cart_item.cart_quantity = params[:cart_item][:cart_quantity].to_i
   @cart_item.item_id = params[:cart_item][:cart_id].to_i
   @cart_item.cart_id = Cart.find_by(user_id:current_user.id).id
   @cart_item.save
    redirect_to user_carts_path(:id)
end



 def destroy
 end

end