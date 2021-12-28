class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile, allow_destroy: true
  has_many :portfolios, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :messages, dependent: :destroy
  validates :email, presence: true, length: { maximum: 150 }

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.build_profile(name: 'ゲストユーザー(一般)')
      user.password = 888_888
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end

  def self.guest_admin
    find_or_create_by(email: 'admin_guest@gmail.com') do |user|
      user.build_profile(name: 'ゲストユーザー(管理者)')
      user.password = 999_999
      user.admin = true
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end

  def self.guest_corporate
    find_or_create_by(email: 'corporate_guest@gmail.com') do |user|
      user.build_profile(name: 'ゲストユーザー(企業)')
      user.password = 100_100
      user.corporate = true
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable, :confirmable
end
