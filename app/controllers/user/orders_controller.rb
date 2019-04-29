class User::OrdersController < User::Base

  def index
      @user = current_user
      @order = Order.where(user_id: @user.id)
    # @order_items = CartItem.where(order_id: @order)
  end

  def create
    order = Order.new
      order.user_id = current_user.id
      order.shipping_postal_code = current_user.postal_code
      order.shipping_home_address = current_user.home_address

      order_item = OrderItem.new
       order_item.cart_id = current_user.carts.last
       order_item.item_id = params[:order_item][:item_id]
       order_item.ordered_quantity = params[:order_item][:ordered_quantity].to_i
       order_item.save
       item = Item.find_by(id: params[:cart_item][:item_id])
       # #今ここ
       #total_priceの保存がまだできていない
       # order.total_price = cart.totalprice
       # item.item_price * params[:cart_item][:cart_quantity].to_i
       order.save

    end
      redirect_to user_orders_path(current_user)
  end

  def order_item_params
      params.require(:order_item). permit( :order_id, :item_id,  :ordered_price, :ordered_quantity )
  end

  def order_params
    params.require(:order).permit(:total_price, :shipping_postal_code, :shipping_home_address)
   end
end

