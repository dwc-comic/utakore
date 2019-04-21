class Admin::ItemsController < Admin::Base
  def new
    @item = Item.new
    @disc = @item.discs.build
    @song = @disc.songs.build
  end

  def create
    item = Item.create(item_params)
    item.save
    redirect_to admin_items_path
  end

  def index
    @items = Item.page(params[:page]).reverse_order
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(item.id)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to admin_items_path
  end

  private
  def item_params
    params.require(:item).permit(:id, :title, :image, :artist_name, :lebel, :genre, :item_price, :stock,
                                 discs_attributes: [:id, :item_id, :disc_number, :_destroy,
                                 songs_attributes: [:id, :disc_id, :song_number, :song_name, :_destroy]])
  end
end