# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_06_29_203705) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "approvers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.date "date"
    t.string "state"
    t.string "city"
    t.bigint "project_id"
    t.bigint "hire_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hire_id"], name: "index_events_on_hire_id"
    t.index ["project_id"], name: "index_events_on_project_id"
  end

  create_table "hires", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "goal"
    t.string "note"
    t.string "status"
    t.bigint "project_id"
    t.bigint "supplier_id"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "approver_id"
    t.decimal "price"
    t.datetime "due_date"
    t.index ["approver_id"], name: "index_orders_on_approver_id"
    t.index ["owner_id"], name: "index_orders_on_owner_id"
    t.index ["project_id"], name: "index_orders_on_project_id"
    t.index ["supplier_id"], name: "index_orders_on_supplier_id"
  end

  create_table "orders_people", id: false, force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "person_id", null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "rg"
    t.string "cpf"
    t.string "role"
    t.date "date_of_birth"
    t.string "zip_code"
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "street"
    t.string "neighborhood"
    t.string "complement"
    t.integer "number"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_people_on_project_id"
  end

  create_table "production_sheets", force: :cascade do |t|
    t.string "place"
    t.string "address"
    t.boolean "open_place"
    t.boolean "vehicle_accesses_backstage"
    t.string "kind"
    t.string "opening_public"
    t.string "lineup"
    t.integer "audience_capacity"
    t.string "start_time"
    t.string "general_producer"
    t.string "general_producer_phone"
    t.string "event_holder"
    t.string "event_holder_phone"
    t.string "feeding_holder"
    t.string "feeding_holder_phone"
    t.string "sound_holder"
    t.string "sound_holder_phone"
    t.string "lighting_holder"
    t.string "lighting_holder_phone"
    t.string "stage_holder"
    t.string "stage_holder_phone"
    t.string "led_holder"
    t.string "led_holder_phone"
    t.string "transport_holder"
    t.string "transport_holder_phone"
    t.string "assistant_holder"
    t.string "assistant_holder_phone"
    t.string "dressing_room_holder"
    t.string "dressing_room_holder_phone"
    t.string "security_holder"
    t.string "security_holder_phone"
    t.string "hotel_name"
    t.string "hotel_holder"
    t.string "hotel_phone"
    t.boolean "parking"
    t.boolean "bus_parking"
    t.string "hotel_city"
    t.string "hotel_state"
    t.string "hotel_address"
    t.string "distance"
    t.string "checkin_time"
    t.string "email"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_production_sheets_on_event_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "document_number"
    t.string "phone"
    t.string "email"
    t.string "adress"
    t.string "bank"
    t.string "ag"
    t.string "cc"
    t.string "pix"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "document_number"
    t.string "phone"
    t.string "email"
    t.string "adress"
    t.string "bank"
    t.string "ag"
    t.string "cc"
    t.string "pix"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "events", "hires"
  add_foreign_key "events", "projects"
  add_foreign_key "orders", "approvers"
  add_foreign_key "orders", "owners"
  add_foreign_key "orders", "projects"
  add_foreign_key "orders", "suppliers"
  add_foreign_key "people", "projects"
  add_foreign_key "production_sheets", "events"
end
