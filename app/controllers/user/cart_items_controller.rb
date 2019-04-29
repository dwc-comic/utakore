class User::CartItemsController < User::Base

# def index
#     @user = current_user
#     @cart_item = CertsItem.where(user_id: @user)
#   end


  # def new
  #   @cart_item = CartItem.new
 # end

  # def create
  #   @cart_item = CartItem.new(cart_item_params)
  #   cart_item .save(cart_item)
  #   redirect_to user_orders_path(user.id)
  # end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart = Cart.find(cart_item.cart_id)
    cart.update(totalprice: cart.totalprice - cart_item.item.item_price  * cart_item.cart_quantity)
    cart_item.destroy
    redirect_back(fallback_location: user_carts_path)
  end

   private

  #  def cart_item_params
  #   params.require(:cart_item). permit(:cart_id, :item_id )
  # end
end
