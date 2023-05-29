# frozen_string_literal: true
require 'roo'

class ImportPeopleService
  attr_reader :project_id, :file

  def initialize(project_id, file)
    @project_id = project_id
    @file = file
  end

  def execute
    xlsx = Roo::Excelx.new(@file.tempfile)
    xlsx.each_row_streaming(offset: 3) do |row|
      Person.create(
        project_id: @project_id,
        name: row[0].value,
        rg: row[1].value,
        cpf: row[2].value,
        role: row[3].value,
        date_of_birth: row[4].value
      )
    end
  end
end
