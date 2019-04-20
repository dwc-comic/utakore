class User::ItemsController < User::Base

  def index
  	@items = Item.all
  end

  def show
  end
end


