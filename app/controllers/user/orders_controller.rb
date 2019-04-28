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
    cart.each do |cart|
  	order = Order.new
  	order.user_id = current_user.id
  	order.cart_id = cart.id
    order.shipping_postal_code = current_user.postal_code
  	order.shipping_home_address = current_user.home_address
  # 	#下にカートIDを保存するアクションを書く
  # 	#order.order_id = params[:order_id]
    order.save
    end

  	#下記はorder_itemの保存
     orders = Order.where(user_id: current_user.id)
     orders.each do |order|
      order_item = OrderItem.new
  		order_item.order_id = order.id #中間テーブルのorder_idに代入
      cart = order_item.order #orderを取得
      cart = cart.cart #orderに紐づくcartを取得
      cart_items = cart.cart_items #cartに紐づくcart_itemを取得(配列)

      # carts = current_user.carts
      # order_item.save
    end
      # cart_item = carts.cart_item
      # cart_items.each do |item|
      #   order_item.item_id = item.item_id
      # end
      # order_item.item_id = params[:order_id][:cart_id][:cart_item_id]
  		# order_item.ordered_price = params[:item_price]
  # 		# order_item.ordered_quantity = params [:order_item][:order_quantity]
      # binding.pry
      # order_item.save
   # 	#order_itemの保存のアクションをOrderテーブル保存後にやる。
      redirect_to user_orders_path(current_user)
  end

  #[:current_user][:cart_id].exist?
  # def index
  #     @order_items = OrderItem.all
  # end

  # def show
  # end


   #  if [:item_id].empty?
   #    order = Order.new
   #    order.user_id = current_user.id
   #    order.order_id = current_user.order_id
   #    order.total_price =
   #    order.save

   #   order_item = OrderItem.new
   #   order_item.order_id = Order.find_by(user_id:current_user.id).id
   #   order_item.order_quantity = params[:order_item][:order_quantity].to_i
   #   order_item.item_id = params[:order_item][:order_id].to_i
   #   order_item.save
   #   redirect_to user_orders_path(:id)

   #  else

   #   order_item = OrderItem.new
   #   order_item.order_id = Order.find_by(user_id:current_user.id).id
   #   order_item.item_id = params[:order_item][:order_id].to_i
   #   order_item.order_quantity = params[:order_item][:order_quantity].to_i
   #   order_item.save
   #   redirect_to user_orders_path(:id)
   # end


  def order_params
      params.require(:order). permit( :user_id, :order_id, :total_price, :shipping_postal_code, :shipping_home_addres )
  end

  def order_item_params
      params.require(:order_item). permit( :order_id, :item_id,  :ordered_price, :ordered_quantity )
  end
end