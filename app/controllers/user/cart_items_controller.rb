class User::CartItemsController < User::Base

def index
    @user = current_user
    @cart_item = CertsItems.where(user_id: @user)
  end


  def new
    @cart_item = CartItem.new
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    cart_item .save(cart_item)
    redirect_to user_orders_path(user.id)
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item .destroy
    redirect_to user_carts_index_path
  end

end
