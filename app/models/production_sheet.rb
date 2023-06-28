class ProductionSheet < ApplicationRecord
  belongs_to :event
  delegate :project, :hire, :date, to: :event

  def completed?
    !self.attributes.values.include?(nil) && !self.attributes.values.include?('')
  end

  def encrypted_id
    EncryptionService.new(self.id).encrypt
  end
end
