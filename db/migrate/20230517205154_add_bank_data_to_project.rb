class AddBankDataToProject < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :document_number, :string
    add_column :projects, :phone, :string
    add_column :projects, :email, :string
    add_column :projects, :adress, :string
    add_column :projects, :bank, :string
    add_column :projects, :ag, :string
    add_column :projects, :cc, :string
    add_column :projects, :pix, :string
  end
end
