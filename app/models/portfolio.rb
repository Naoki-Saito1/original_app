class Portfolio < ApplicationRecord
  mount_uploader :portfolio_image, ImageUploader
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :frameworks, dependent: :destroy
  accepts_nested_attributes_for :frameworks, allow_destroy: true
  enum portfolio_language:{
    Java:0,
    JavaScript:1,
    PHP:2,
    Python:3,
    Ruby:4,
    C:5,
    'C++':6,
    'C#':7,
    Kotlin:8,
    Swift:9,
    Go:10,
    その他:11

  }
  
  def favorite_user(user_id)
    favorites.find_by(user_id: user_id)
   end
end
