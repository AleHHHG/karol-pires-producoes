class Event < ApplicationRecord
  validates :date, presence: true
  belongs_to :hire
  belongs_to :project
  has_one :production_sheet, dependent: :destroy
  after_create :create_production_sheet

  private

  def create_production_sheet
    ProductionSheet.create(event_id: self.id)
  end
end
