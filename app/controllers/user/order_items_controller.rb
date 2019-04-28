class User::OrderItemsController <  User::Base

  def create
    @order_item = OrderItem.new(cart_item_params)
    order_item .save(order_item)
    redirect_to user_orders_path(user.id)
  end

  def destroy
    order_item = OrderItem.find(params[:id])
    order_item .destroy
    redirect_to user_orders_path
  end

end
