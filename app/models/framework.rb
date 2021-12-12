class Framework < ApplicationRecord
  validates :framework_name, length: { maximum: 20 }, allow_blank: true
  before_validation { framework_name.downcase! }
  belongs_to :portfolio
end