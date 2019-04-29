class User::CartsController < User::Base
include User::CartsHelper


  before_action :setup_cart_items!, only: [:add_items, :update_items, :delete_items]

  def index
      @user = current_user
      @cart = current_user.carts.last
      @order_item = OrderItem.new

  end

  def create
    #カートの有無
    cart = current_user.carts.last
    if cart
    #カートアイテムに追加するitem_idが存在しているか
      cart_item =  cart.cart_items.find_by(item_id: params[:cart_item][:item_id])
      if cart_item
        cart_item.cart_quantity += params[:cart_item][:cart_quantity].to_i
        cart_item.save
        # params[:cart_item][:cart_quantity] = (cart_item.cart_quantity + params[:cart_item][:cart_quantity].to_i).to_s

         # アイテム合計は      元々のアイテム(a)数プラス送られてきたアイテム(a)の数
        # アイテム(a)の数×金額
        # cart_item.update(cart_item_params)
        # #cart.totalprice = [:cart_item][:item_prise] * [:cart_item][:cart_quantity]
        # cart.totalprice = cart.cart_items.item.pluck(:price)
        # cart.updete
      else
        add_item(current_user.carts.last, Item.find(params[:cart_item][:item_id]), params[:cart_item][:cart_quantity])
        # 元々のアイテム(a)数×金額
        # 新しく追加されたアイテム(b)×金額
        # 元々のアイテム(a)数×金額＋新しく追加されたアイテム(b)×金額
        # カートのトータルプライスに入れる
        # カート保存
        # cart.totalprice ||= 0
        # binding.irb
        # cart.totalprice += item.item_price * params[:cart_item][:cart_quantity].to_i

      end
        # item = Item.find_by(id: params[:cart_item][:item_id])
        # cart.totalprice += item.item_price * params[:cart_item][:cart_quantity].to_i
        # cart.save

    else
      create_cart(current_user)
      add_item(current_user.carts.last, params[:cart_item][:item_id], params[:cart_item][:cart_quantity].to_i)


       cart.totalprice = get_total_price(CartItem.where(cart_id: current_user.cart.id))
   end
   redirect_to user_carts_path
#      カートを新しく









# 作トのuser.idはログインユーザーを入れる
# 　　　カート保存
#      カートアイテムを作る
#      カートアイテムのcart_idはユーザーidが持っているカートid
#      カートアイテムのtem_idはパラメーターで送られてきたitem_id
#      カートアイテムのcart_quantitはパラメーターで送られてきた[:cart_quantity]
#      カートアイテムを更新
#      アイテムの金額×数
#      cart.totalpriceに保存
#      カート更新






   #     cart_item.cart.id = CartItem.find_by(:cart_id)
   #      cart_item.item_id  == CartItem.finf_by(:item_id)
   #     #持ってきたカートアイテム内に同じItem_idが入っていた場合
   #     if cart_item.item_id =
   #      #item_quantityだけ追加する
   #     cart_item = CartItem.find_by(params[:id])
   #     #else
   #     #Current_userに紐ずいたカートにカートアイテムを追加する
   #     cart_item.item_id = params[:cart_item][:id].to_i# CartItem.exists?(:item_id => params[:id])
   #     cart_item.cart_quantity += params[:cart_item][:cart_quantity].to_i
   #     cart_item.cart_quantity = params[:cart_item][:cart_quantity].to_i
   #     cart_item.save
   #   else
   #     cart.totalprice = cart.get_total_price(cart)
   #     cart.save
   #     # Cart.sum(total_price [:include]) = CartItem.params([:cart_tiem_] [:item_id][:item_price]).to_i
   #     redirect_to user_carts_path(:id)

   #  else
   #     #カートを持っていない場合で、カートを作成する
   #    cart = Cart.new
   #    cart.user_id = current_user.id
   #    cart.save

   #   cart_item = CartItem.new
   #   cart_item.cart_id = Cart.find_by(user_id:current_user.id).id
   #   cart_item.item_id = params[:cart_item][:cart_id].to_i
   #   cart_item.cart_quantity = params[:cart_item][:cart_quantity].to_i
   #   cart_item.save
   #   redirect_to user_carts_path(:id)

   # end

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

    # def destroy
    #   cart_item = CartItem.params[:cart_item][:item_id]
    #   cart_item.destroy
    #   cart.totalprice = Cart.params[:cart_item][:item_id]
    #   cart.totalprice.destroy
    #   redirect_back(fallback_location: user_carts_path)
    # end
    def update
    end

    def destroy
       cart = Cart.find(cart_item_params[:cart_id])
    cart.update(totalprice: cart.totalprice - Cart[:item_id][:item_prise] )
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_back(fallback_location: user_carts_path)
    end

  private

   def order_item_params
    params.require(:order_item). permit(:order_id, :ordered_price, :ordered_quantity, :item_id )
   end
   def cart_item_params
    params.require(:cart_item).permit(:cart_id, :item_id, :cart_quantity)
   end

   def cart_params
    params.require(:cart).permit(:totalprice)
   end


end
