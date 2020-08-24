class Recipe < ApplicationRecord
    
    belongs_to :user
	belongs_to :recipe_category
	has_many :favorites, dependent: :destroy
	has_many :recipe_tags, dependent: :destroy
	has_many :tags, through: :recipe_tags
	has_many :calendars, dependent: :destroy
	attachment :image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
