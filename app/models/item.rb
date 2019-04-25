class Item < ApplicationRecord
	has_many :favorites, dependent: :destroy
	has_many :cart_items, dependent: :destroy
	has_many :order_items, dependent: :destroy
	has_many :cart,through: :cart_items
	has_many :discs, inverse_of: :item
    accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
	has_many :tag_maps, dependent: :destroy
	has_many :tags, through: :tag_maps
	attachment :image
	acts_as_paranoid




	def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end
end
