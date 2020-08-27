class Recipe < ApplicationRecord
    
    belongs_to :user
	belongs_to :recipe_category
	has_many :favorites, dependent: :destroy
	has_many :interests, dependent: :destroy
	has_many :recipe_tags, dependent: :destroy
	has_many :tags, through: :recipe_tags
	has_many :calendars, dependent: :destroy
	has_many :users, through: :favorites
	has_many :recipe_ingredients ,dependent: :destroy
	has_many :seasonings, dependent: :destroy

	accepts_nested_attributes_for :recipe_ingredients,allow_destroy: true
	accepts_nested_attributes_for :seasonings,allow_destroy: true

	attachment :image

	validates :name, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def interested_by?(user)
    interests.where(user_id: user.id).exists?
  end

end
