class User::CartsController < User::Base

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
        おなじアイテムがあったら
        params[:cart_item][:cart_quantity] = (cart_item.cart_quantity + params[:cart_item][:cart_quantity].to_i).to_s
        カートアイテムとカートの数は
        既にあるカートアイテムの数とカート数にプラス送られてきたカートの数にする

        cart_item.update(cart_item_params)カートあいてむカラムのカートの数を更新する
      else
        cart_item = CartItem.new
        カートアイテムを作るする
        item = Item.find_by(id: params[:cart_item][:item_id])
        あいてむという変数はパラムスで送られてきたカートアイテムのidである
        cart_item.item_id = params[:cart_item][:item_id]
　　　　　カートアイテムのアイテムidはパラメターで送られてきたカートアイテムのアイテムidである
        cart_item.cart_id = cart.id
        カートアイテムのカートidは
        cart_item.cart_quantity = params[:cart_item][:cart_quantity]
        カートアイテムのカート数は　パラメターで送られてきたカートアイテムの数である
        cart_item.save
        カートアイテムを保存する
      end
        item = Item.find_by(id: params[:cart_item][:item_id])
        cart.totalprice += item.item_price * params[:cart_item][:cart_quantity].to_i
        cart.save
    else
      cart = Cart.new
      cart.user_id = current_user.id

      cart_item = CartItem.new
       cart_item.cart_id = Cart.find_by(user_id:current_user.id).id
       cart_item.item_id = params[:cart_item][:item_id]
       cart_item.cart_quantity = params[:cart_item][:cart_quantity].to_i
       cart_item.save
       item = Item.find_by(id: params[:cart_item][:item_id])
       cart.totalprice += item.item_price * params[:cart_item][:cart_quantity].to_i
       cart.save
   end
   redirect_to user_carts_path
  end
    def destroy
      cart = Cart.find(cart_item_params[:cart_id])
      cart.update(totalprice: cart.totalprice - Cart[:item_id][:item_prise] )
      cart_item = CartItem.find(params[:id])
      cart_item.destroy
      redirect_back(fallback_location: user_carts_path)
    end

  private

   def cart_item_params
    params.require(:cart_item).permit(:cart_id, :item_id, :cart_quantity)
   end

   def cart_params
    params.require(:cart).permit(:totalprice)
   end


end
