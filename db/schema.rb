# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141114154012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "resources_id"
  end

  create_table "city_resources", force: true do |t|
    t.integer  "wood"
    t.integer  "stone"
    t.integer  "food"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "city_societies", force: true do |t|
    t.integer  "citizens",      default: 10
    t.integer  "food_workers",  default: 5
    t.integer  "wood_workers",  default: 0
    t.integer  "stone_workers", default: 0
    t.integer  "city_id",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credentials", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "credentials", ["email"], name: "index_credentials_on_email", unique: true, using: :btree
  add_index "credentials", ["reset_password_token"], name: "index_credentials_on_reset_password_token", unique: true, using: :btree

  create_table "turns", force: true do |t|
    t.integer  "turn_number", default: 1
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
