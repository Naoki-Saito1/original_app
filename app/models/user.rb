class User < ApplicationRecord
  has_one :profile
  accepts_nested_attributes_for :profile
  has_many :portfolios
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
  # def self.profile_default
  #   @profile = Profile.create(name:"test", detail:"", body:"", user_id: current_user.id)
  #   @profile.save
  #   # redirect_to profile_path(@profile.id)
  # end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable
end
