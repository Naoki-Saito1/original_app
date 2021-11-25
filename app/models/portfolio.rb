class Portfolio < ApplicationRecord
  mount_uploader :portfolio_image, ImageUploader
  belongs_to :user
end
