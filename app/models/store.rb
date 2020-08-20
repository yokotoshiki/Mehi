class Store < ApplicationRecord
	belongs_to :store_category
	attachment :image

	enum area:{
		全国:1,
		北海道:2,
		東北:3,
		関東:4,
		中部:5,
		関西:6,
		中国:7,
		四国:8,
		九州:9,
	}
end
