class AddBankDataToSupplier < ActiveRecord::Migration[7.0]
  def change
    add_column :suppliers, :document_number, :string
    add_column :suppliers, :phone, :string
    add_column :suppliers, :email, :string
    add_column :suppliers, :adress, :string
    add_column :suppliers, :bank, :string
    add_column :suppliers, :ag, :string
    add_column :suppliers, :cc, :string
    add_column :suppliers, :pix, :string
  end
end
