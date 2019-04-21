class User::CartItemsController < User::Base
def index
  	@cart_items = Cartitems.all
end
end
