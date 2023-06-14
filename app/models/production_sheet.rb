class ProductionSheet < ApplicationRecord
  belongs_to :event
  delegate :project, :hire, :date, to: :event
end
