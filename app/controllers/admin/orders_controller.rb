class Admin::OrdersController < Admin::Base

  def index
      @user = current_user
      @order = Order.where(user_id: @user.id)
      @order_items = OrderItem.all
  end

  def show
  end

  def edit
  end
end