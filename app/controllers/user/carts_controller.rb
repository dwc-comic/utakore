class User::CartsController < User::Base

  before_action :setup_cart_items!, only: [:add_items, :update_items, :delete_items]

  def index
      @user = current_user
      @cart = Cart.find_by(user_id: @user.id)
      @order_item = OrderItem.new

  end


  # def new
  #     @cart_item = Cart_item.new
  # end
  #binding.pry
  # binding.pry

  def create
#カートを持っている場合の処理（商品を追加する）
    # if Cart.exists?(:user_id => current_user.id)
    if cart =  Cart.find_by(:user_id => current_user.id)
       cart_item = CartItem.find_by(params[:id])
       # cart_item.cart_id = Cart.find_by(user_id:current_user.id).id
       cart_item.item_id = params[:cart_item][:id].to_i
       # CartItem.exists?(:item_id => params[:id])
       cart_item.cart_quantity += params[:cart_item][:cart_quantity].to_i
       cart_item.cart_quantity = params[:cart_item][:cart_quantity].to_i
       cart_item.save
       cart.totalprice = cart.get_total_price(cart)
       cart.save
       # Cart.sum(total_price [:include]) = CartItem.params([:cart_tiem_] [:item_id][:item_price]).to_i
       redirect_to user_carts_path(:id)

    else
       #カートを持っていない場合で、カートを作成する
      cart = Cart.new
      cart.user_id = current_user.id
      cart.save

     cart_item = CartItem.new
     cart_item.cart_id = Cart.find_by(user_id:current_user.id).id
     cart_item.item_id = params[:cart_item][:cart_id].to_i
     cart_item.cart_quantity = params[:cart_item][:cart_quantity].to_i
     cart_item.save
     redirect_to user_carts_path(:id)

   end

     #  cart_id.item_id = cart_item
     # @cart.user_id = current_user.id
     # @cart.save
        # cart_item.cart_quantity =+ CartItem.find_by(params[:cart_quantity ])

     # @cart_item = CartItem.new
     # @cart_item.cart_quantity = params[:cart_item][:cart_quantity].to_i
     # @cart_item.item_id = params[:cart_item][:cart_id].to_i
     # @cart_item.cart_id = Cart.find_by(user_id:current_user.id).id
     # @cart_item.save
     # redirect_to user_carts_path(:id)

      # @order = Order.new
      # @order.user_id = current_user.id
      # #合計金額の保存
      # # @order.total_price =
      # @order.shipping_postal_code = current_user.postal_code
      # @order.shipping_home_address = current_user.home_address
      # @order.save

      #@order_item = OrderItem.new
      #@order_item.order_id = Order.find_by(user_id:current_user.id).id
      #@order_item.ordered_quantity = params[:order_item][:ordered_quantity].to_i
      #@order_item.item_id = params[:ordered_item][:order_id].to_i
      #@order_item.ordered_price = params[:order_item][:item_id][:item_price]
      #@order_item.save
      #redirect_to user_cart_path(:id)
  end

   def destroy
   end

  private

   def order_item_params
    params.require(:order_item). permit(:order_id, :ordered_price, :ordered_quantity, :item_id )
   end


end
