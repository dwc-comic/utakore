class User::OrdersController < User::Base

  def index
      @user = current_user
      @order = Order.where(user_id: @user.id)
      @order_items = OrderItem.all
      order = Order.find_by(user_id:current_user.id)
    # @order_items = CartItem.where(order_id: @order)
  end

  def create
  	# orders = current_user.orders.where(deleted_at: nil)
    # carts = current_user.carts
    # cart.each do |cart|
    cart = Cart.find_by(user_id:current_user.id)
    # cart.each do |cart|
  	order = Order.new
  	order.user_id = current_user.id
  	order.cart_id = cart.id
    order.shipping_postal_code = current_user.postal_code
  	order.shipping_home_address = current_user.home_address
  # 	#下にカートIDを保存するアクションを書く
  # 	#order.order_id = params[:order_id]
    order.save


  	#下記はorder_itemの保存
     # orders = Order.where(user_id: current_user.id)
     cart.cart_items.each do |cart_item|
      order_item = OrderItem.new
      # cart = Cart.find_by(id: current_user.carts.last)
  		order_item.order_id = order.id
      order_item.item_id = cart_item.item.id
      order_item.ordered_price =cart_item.item.item_price
      order_item.ordered_quantity = cart_item.cart_quantity
      order_item.save
    end
      redirect_to user_orders_path
  end

  def order_item_params
      params.require(:order_item). permit( :order_id, :item_id,  :ordered_price, :ordered_quantity )
  end
end