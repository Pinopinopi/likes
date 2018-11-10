class Micropost < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :favorites, dependent: :destroy
  # def favorites
  #   Favorite.where(user_id: self.id)
  # end
  
  has_many :favorite_users, through: :favorites, source: :user
  # def favorite_microposts
  # Micropost.where(id: self.favorites.pluck(:micropost_id))
  # end
end
