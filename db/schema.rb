# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_21_144153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "itemarchives", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.boolean "status"
    t.bigint "listitem_id"
    t.index ["listitem_id"], name: "index_itemarchives_on_listitem_id"
  end

  create_table "listitems", force: :cascade do |t|
    t.string "title"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "todolist_id"
    t.index ["todolist_id"], name: "index_listitems_on_todolist_id"
  end

  create_table "todolists", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_todolists", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "todolist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["todolist_id"], name: "index_users_todolists_on_todolist_id"
    t.index ["user_id"], name: "index_users_todolists_on_user_id"
  end

  add_foreign_key "itemarchives", "listitems"
  add_foreign_key "listitems", "todolists"
  add_foreign_key "users_todolists", "todolists"
  add_foreign_key "users_todolists", "users"
end
