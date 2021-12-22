class Framework < ApplicationRecord
  validates :framework_name, length: { maximum: 15 }
  # before_validation { framework_name.downcase! }
  belongs_to :portfolio
end
