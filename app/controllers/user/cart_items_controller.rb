class User::CartItemsController < User::Base

def index
    @user = current_user
    @cart_item = Certs_items.where(user_id: @user)
  end

  def create
    item = Item.find(params[:item_id])
    cart_item  = current_user.cart_item .new(item_id: item.id)
    cart_item .save
    redirect_to user_carts_index_path
    @cart_item = Cart_item.new
  end

  def new
    @cart_item = Cart_item.new
  end


  def destroy
    item = Item.find(params[:item_id])
    cart_item  = current_user.cart_item .find_by(item_id: item.id)
    cart_item .destroy
    redirect_to user_item_path(item)
  end

end
