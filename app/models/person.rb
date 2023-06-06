class Person < ApplicationRecord
  validates :name, :rg, :cpf, :date_of_birth, :role, presence: true
  has_and_belongs_to_many :orders
  belongs_to :project
  scope :by_project, -> project { where(project: project) }
  scope :by_name, -> name { where("name ILIKE ?", "%#{name}%") }
end
