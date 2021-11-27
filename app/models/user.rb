class User < ApplicationRecord
  has_one :profile
  has_many :portfolios
  has_many :favorites, dependent: :destroy
  has_many :messages, dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable
end
