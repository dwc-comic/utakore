class Admin::ItemController < ApplicationController
  def new

  end

  def index
  end

  def show
  end

  def edit
  end

  private
  	def item_params
  		params.require(:item).permit(:title, :image, :artists, :lebel, :genre, :price, :stock)
  	end
end
