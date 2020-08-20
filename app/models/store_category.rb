class StoreCategory < ApplicationRecord
	has_many :stores, dependent: :destroy
end
