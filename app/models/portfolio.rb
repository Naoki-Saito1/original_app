class Portfolio < ApplicationRecord
  mount_uploader :portfolio_image, ImageUploader
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :frameworks, inverse_of: :portfolio, dependent: :destroy
  accepts_nested_attributes_for :frameworks, allow_destroy: true
  validates :portfolio_title, presence: true
  validates :portfolio_body, presence: true
  validates :portfolio_url, presence: true
  validates :portfolio_title, length: { maximum: 40 }
  validates :portfolio_body, length: { maximum: 1000 }
  validates :portfolio_url, format: { with: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/ },
                            allow_blank: true
  validates :portfolio_github, format: %r{https?://[\w/:%#{Regexp.last_match(0)}?()~.=+\-]+|\A\z}
  # scope :portfolio_language, -> (hoge){where(portfolio_language: hoge)}
  def self.ransackable_scopes(_auth_object = nil)
    %i[portfolio_language]
  end
  enum portfolio_language: {
    'HTML.CSS': 1,
    Java: 2,
    JavaScript: 3,
    PHP: 4,
    Python: 5,
    Ruby: 6,
    C: 7,
    'C++': 8,
    'C#': 9,
    Kotlin: 10,
    Swift: 11,
    Go: 12,
    その他: 13

  }

  def favorite_user(user_id)
    favorites.find_by(user_id: user_id)
  end
end
