class Recipe < ApplicationRecord
    
    belongs_to :user
	belongs_to :recipe_category
	has_many :favorites, dependent: :destroy
	attachment :image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
