class User::OrdersController < User::Base

def new
  	p current_user
  	@user = current_user
    @cart = Cart.find_by(user_id: @user.id)
    # @cart_items = CartItem.where(cart_id: @cart)
    order = Order.new
    order_item = OrderItem.new
  end

  def create
  	carts = current_user.carts.where(deleted_at: nil)
  	order = Order.new
  	order.user_id = current_user.id
  	order.user_id = current_user.postal_code
  	order.user_id = current_user.home_address
  	#下にカートIDを保存するアクションを書く
  	order.cart_id = params[:cart_id]
  	order.save

  	#下記はorder_itemの保存
      order_item = OrderItem.new
  		order_item.order_id = order.id
  		order_item.item_id = params[:item_id]
  		order_item.ordered_price = params[:item_price]
  		order_item.ordered_quantity = params[:cart_quantity]
  		order_item.save
  	#order_itemの保存のアクションをOrderテーブル保存後にやる。
  	redirect_to user_orders_path
  end


  def index
      @orders = Order.find(current_user[:id])
  end

  def show
  end
end