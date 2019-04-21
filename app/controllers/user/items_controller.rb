class User::ItemsController < User::Base

  def index
  	@items = Item.page(params[:page]).reverse_order
    @search = Item.ransack(params[:q])
    @item = @search.result
  end

  def show
  	@item = Item.find(params[:id])
  end
end


