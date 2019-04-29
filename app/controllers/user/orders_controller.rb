class User::OrdersController < User::Base

  def index
      @user = current_user
      @order = Order.where(user_id: @user.id)
    # @order_items = CartItem.where(order_id: @order)
  end

  def create
  	# orders = current_user.orders.where(deleted_at: nil)
    # carts = current_user.carts
    # cart.each do |cart|
    cart = Cart.find_by(user_id:current_user.id).id
    # cart.each do |cart|
  	order = Order.new
  	order.user_id = current_user.id
  	order.cart_id = current_user.carts.last
    order.shipping_postal_code = current_user.postal_code
  	order.shipping_home_address = current_user.home_address
  # 	#下にカートIDを保存するアクションを書く
  # 	#order.order_id = params[:order_id]
    order.save


  	#下記はorder_itemの保存
     orders = Order.where(user_id: current_user.id)
     orders.each do |order|
      order_item = OrderItem.new
      cart = Cart.find_by(id: current_user.carts.last)
  		order_item.order_id = current_user.carts.last
      order_item.item_id = params[:item_id]
      order_item.ordered_price =cart.cart_item
      order_item.ordered_quanitiy = cart.cart_quantity
      order_item.save
    end
      redirect_to user_orders_path(current_user)
  end

  def order_item_params
      params.require(:order_item). permit( :order_id, :item_id,  :ordered_price, :ordered_quantity )
  end
end