class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :interests, dependent: :destroy
  has_many :calendars, dependent: :destroy

  validates :name, presence: true
end
