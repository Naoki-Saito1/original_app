class Portfolio < ApplicationRecord
  mount_uploader :portfolio_image, ImageUploader
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :frameworks, dependent: :destroy
  accepts_nested_attributes_for :frameworks, allow_destroy: true
  validates :portfolio_title, presence: true
  validates :portfolio_body, presence: true  
  validates :portfolio_url, presence: true
  validates :portfolio_title, length: { maximum: 80 }
  validates :portfolio_body, length: { maximum: 1500 }
  validates :portfolio_url, format: /\A#{URI::regexp(%w(http https))}\z/
  validates :portfolio_github, format: /https?:\/\/[\w\/:%#\$&\?\(\)~\.=\+\-]+|\A\z/
  scope :portfolio_language, -> (hoge){where(portfolio_language: hoge)} 
  def self.ransackable_scopes(auth_object = nil)
    %i(portfolio_language)
  end
  enum portfolio_language:{
    'HTML.CSS':0,
    Java:1,
    JavaScript:2,
    PHP:3,
    Python:4,
    Ruby:5,
    C:6,
   'C++':7,
   'C#':8,
    Kotlin:9,
    Swift:10,
    Go:11,
    その他:12

  }
  
  def favorite_user(user_id)
    favorites.find_by(user_id: user_id)
   end
end
