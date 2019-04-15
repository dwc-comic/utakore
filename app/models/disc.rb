class Disc < ApplicationRecord
	has_many :songs, dependent: :destroy
	belongs_to :item
end
