class CreateOrder < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :goal
      t.string :note
      t.string :status
      t.belongs_to :project, index: true, foreign_key: true
      t.belongs_to :supplier, index: true, foreign_key: true
      t.belongs_to :owner, index: true, foreign_key: true
      t.timestamps
    end
  end
end
