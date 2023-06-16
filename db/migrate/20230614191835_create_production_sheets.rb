class CreateProductionSheets < ActiveRecord::Migration[7.0]
  def change
    create_table :production_sheets do |t|
      t.string :place
      t.string :address
      t.boolean :open_place
      t.boolean :vehicle_accesses_backstage
      t.string :kind
      t.string :opening_public
      t.string :lineup
      t.integer :audience_capacity
      t.string :start_time
      t.string :general_producer
      t.string :general_producer_phone
      t.string :event_holder
      t.string :event_holder_phone
      t.string :feeding_holder
      t.string :feeding_holder_phone
      t.string :sound_holder
      t.string :sound_holder_phone
      t.string :lighting_holder
      t.string :lighting_holder_phone
      t.string :stage_holder
      t.string :stage_holder_phone
      t.string :led_holder
      t.string :led_holder_phone
      t.string :transport_holder
      t.string :transport_holder_phone
      t.string :assistant_holder
      t.string :assistant_holder_phone
      t.string :dressing_room_holder
      t.string :dressing_room_holder_phone
      t.string :security_holder
      t.string :security_holder_phone
      t.string :hotel_name
      t.string :hotel_holder
      t.string :hotel_phone
      t.boolean :parking
      t.boolean :bus_parking
      t.string :hotel_city
      t.string :hotel_state
      t.string :hotel_address
      t.string :distance
      t.string :checkin_time
      t.string :email
      t.belongs_to :event, index: true, foreign_key: true
      t.timestamps
    end
  end
end
