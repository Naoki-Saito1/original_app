class User < ApplicationRecord
  has_one :profile
  has_many :portfolios
  has_many :favorites, dependent: :destroy
  has_many :messages, dependent: :destroy
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end
  def self.guest_admin
    find_or_create_by(email: 'admin_guest@gmail.com') do |user|
      user.password = 999999
      user.admin = true
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
  # def profile_default
  #   @profile = Profile.new(name:"test", detail:"", body:"", user_id: current_user.id)
  #   @profile.save
  #   # redirect_to profile_path(@profile.id)
  # end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable
end
