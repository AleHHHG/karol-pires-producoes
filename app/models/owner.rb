class Owner < ApplicationRecord
  validates :name, presence: true
  has_many :orders
end
