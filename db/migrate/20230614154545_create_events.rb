class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.string :state
      t.string :city
      t.belongs_to :project, index: true, foreign_key: true
      t.belongs_to :hire, index: true, foreign_key: true
      t.timestamps
    end
  end
end
