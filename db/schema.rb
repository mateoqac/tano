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

ActiveRecord::Schema[7.0].define(version: 2022_07_23_095147) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "timescaledb"

  create_table "citizenship_checkers", force: :cascade do |t|
    t.string "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "login_users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "confirmed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.index ["email"], name: "index_login_users_on_email", unique: true
  end

  create_table "subscriber_users", force: :cascade do |t|
    t.string "email"
    t.bigint "citizenship_checker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "to_do_items", force: :cascade do |t|
    t.string "task"
    t.boolean "done"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "to_do_lists_id"
    t.index ["to_do_lists_id"], name: "index_to_do_items_on_to_do_lists_id"
  end

  create_table "to_do_lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "to_do_sub_tasks", force: :cascade do |t|
    t.string "task"
    t.boolean "done"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "to_do_items_id"
    t.index ["to_do_items_id"], name: "index_to_do_sub_tasks_on_to_do_items_id"
  end

  create_table "workflows", force: :cascade do |t|
    t.string "workflow_type"
    t.string "step_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
