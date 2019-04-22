class User::CartsController < User::Base

before_action :setup_cart_items!, only: [:add_items, :update_items, :delete_items]

def index
    @carts = Cart.all
  	@cart_items = current_user.carts.last.cart_items
    ## @cart.cart_items(:items_id)

end

def create
  @carts = Cart.new
  cart.save
  redirect_to user_carts_path(cart.id)
end

def add_item

if    @cart_item.blank?
      @cart_item = current_cart.cart_items.build(items_id: params[:items_id])
end

    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save
    redirect_to current_cart
end

  # カート詳細画面から、「更新」を押した時のアクション
def update_item
    @cart_item.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
end

# カート詳細画面から、「削除」を押した時のアクション
def delete_item
    @cart_item.destroy
    redirect_to current_cart
end

end
# #current_user.carts.last.cart_items