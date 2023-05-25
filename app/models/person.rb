class Person < ApplicationRecord
  validates :name, :rg, :cpf, :date_of_birth, :role, presence: true
  belongs_to :project
end
