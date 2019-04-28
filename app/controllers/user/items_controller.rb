class User::ItemsController < User::Base

  def index
  	if Item.ransack(params[:q])
	  	@search = Item.ransack(params[:q])
	  	@items = @search.result.page(params[:page]).reverse_order
	else
		 @items = Item.page(params[:page]).reverse_order
	end

  end


  def show
  	@item = Item.find(params[:id])
    @cart_item = CartItem.new

  end


  #  def new
  #   @cart_item = CartItem.new
  # end

  # def create
  #    @cart_item =  CartItem.new(cart_item_params)
  #    cart_item.save(cart_item_params)
  #    redirect_to user_orders_path(user.id)
  # end

  private

  def cart_item_params
      params.require(:cart_item). permit(:id, :cart_id, :item_id, :quantity_id )
  end


end


