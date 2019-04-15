class Item < ApplicationRecord
	has_many :fovorites, dependent: :destroy
	has_many :cart_items, dependent: :destroy
	has_many :order_items, dependent: :destroy
	has_many :discs, dependent: :destroy
	has_many :tag_maps, dependent: :destroy
	has_many :tags, through: :tag_maps
	attachment :image

end
