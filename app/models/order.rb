class Order < ApplicationRecord
  validates :goal, :note, :status, :price, :due_date, presence: true
  belongs_to :project
  belongs_to :supplier
  belongs_to :owner
  belongs_to :approver
  has_and_belongs_to_many :people

  scope :by_project, -> project { where(project: project) }
  scope :by_supplier, -> supplier { where(supplier: supplier) }
  scope :by_owner, -> owner { where(owner: owner) }
  scope :by_approver, -> approver { where(approver: approver) }
  scope :by_status, -> status { where(status: status) }

  enum status: {
    requested: 'Solicitado',
    in_progress: 'Em andamento',
    canceled: 'Cancelado',
    done: 'Concluído'
  }
end
