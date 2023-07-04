class Project < ApplicationRecord
  validates :name, presence: true
  has_many :orders
  has_one_attached :logo
  has_one_attached :office_logo
  has_one_attached :record_logo
  has_one_attached :extra_logo

  def has_logo?
    logo.attached? || office_logo.attached? || record_logo.attached? || extra_logo.attached?
  end
end
