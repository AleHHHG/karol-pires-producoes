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

ActiveRecord::Schema[7.0].define(version: 2023_05_17_205530) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "approvers", force: :cascade do |t|
    t.string "name"
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

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "orders", "approvers"
  add_foreign_key "orders", "owners"
  add_foreign_key "orders", "projects"
  add_foreign_key "orders", "suppliers"
end
