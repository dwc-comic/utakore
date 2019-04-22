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
  end
end


