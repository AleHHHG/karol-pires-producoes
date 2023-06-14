class Hire < ApplicationRecord
  validates :name, :email, :phone_number, presence: true
  has_many :events
end
