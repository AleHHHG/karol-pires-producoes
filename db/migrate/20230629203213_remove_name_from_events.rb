class RemoveNameFromEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :name, :string
  end
end
