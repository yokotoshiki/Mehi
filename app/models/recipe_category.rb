class RecipeCategory < ApplicationRecord
	belongs_to :recipe, optional: true
end
