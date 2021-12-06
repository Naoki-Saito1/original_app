class Framework < ApplicationRecord
  validates :framework_name, format: /\A[a-zA-Z0-9]+\z/
  validates :framework_name, length: { maximum: 15 } 
  before_validation { framework_name.downcase! }
  belongs_to :portfolio
end
