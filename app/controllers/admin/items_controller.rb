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
  end

  def show
  end

  def edit
  end

  private
  def item_params
    params.require(:item).permit(:id, :title, :image, :artists, :lebel, :genre, :item_price, :stock,
                                 discs_attributes: [:id, :item_id, :disc_number, :_destroy,
                                 songs_attributes: [:id, :disc_id, :song_number, :song_name, :_destroy]])
  end
end