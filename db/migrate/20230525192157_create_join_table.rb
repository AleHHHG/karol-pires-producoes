class CreateJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :orders, :people do |t|
      # t.index [:order_id, :person_id]
      # t.index [:person_id, :order_id]
    end
  end
end
