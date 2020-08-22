class Ingredient < ApplicationRecord
	belongs_to :user
	belongs_to :ingredient_category
end
