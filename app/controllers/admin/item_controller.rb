class Admin::ItemController < Admin::Base
  def new
    @item = Item.new
    @disc = @item.discs.build
    @song = @disc.songs.build
  end

  def create
    Item.create(item_params)
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
                                 discs_attributes: [:id, :item_id, :_destroy,
                                 songs_attributes: [:id, :disc_id, :song_number, :song_name, :_destroy]])
  end
end
