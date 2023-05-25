class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :rg
      t.string :cpf
      t.string :role
      t.date :date_of_birth
      t.string :zip_code
      t.string :country
      t.string :state
      t.string :city
      t.string :street
      t.string :neighborhood
      t.string :complement
      t.integer :number
      t.belongs_to :project, index: true, foreign_key: true
      t.timestamps
    end
  end
end
