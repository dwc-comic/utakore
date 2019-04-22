class User::FavoritesController < User::Base

  def create
  	item = Item.find(params[:item_id])
    favorite = current_user.favorites.new(item_id: item.id)
    favorite.save
    redirect_to user_item_path(post_image)
  end

  def destroy
  end
end
