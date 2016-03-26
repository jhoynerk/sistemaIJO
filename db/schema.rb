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

ActiveRecord::Schema.define(version: 20160323202121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer  "code"
    t.string   "description"
    t.datetime "date_start"
    t.datetime "date_end"
    t.integer  "event_id"
    t.integer  "beneficiary_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "activities", ["beneficiary_id"], name: "index_activities_on_beneficiary_id", using: :btree
  add_index "activities", ["event_id"], name: "index_activities_on_event_id", using: :btree

  create_table "activities_resources", id: false, force: :cascade do |t|
    t.integer "activity_id"
    t.integer "resource_id"
  end

  add_index "activities_resources", ["activity_id"], name: "index_activities_resources_on_activity_id", using: :btree
  add_index "activities_resources", ["resource_id"], name: "index_activities_resources_on_resource_id", using: :btree

  create_table "areas", force: :cascade do |t|
    t.integer  "code"
    t.string   "name"
    t.integer  "institute_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "areas", ["institute_id"], name: "index_areas_on_institute_id", using: :btree

  create_table "beneficiaries", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "position"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "beneficiaries_resources", id: false, force: :cascade do |t|
    t.integer "beneficiary_id"
    t.integer "resource_id"
  end

  add_index "beneficiaries_resources", ["beneficiary_id"], name: "index_beneficiaries_resources_on_beneficiary_id", using: :btree
  add_index "beneficiaries_resources", ["resource_id"], name: "index_beneficiaries_resources_on_resource_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.integer  "code"
    t.string   "description"
    t.string   "observations"
    t.datetime "date_start"
    t.datetime "date_end"
    t.integer  "beneficiary_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "events", ["beneficiary_id"], name: "index_events_on_beneficiary_id", using: :btree

  create_table "events_resources", id: false, force: :cascade do |t|
    t.integer "event_id"
    t.integer "resource_id"
  end

  add_index "events_resources", ["event_id"], name: "index_events_resources_on_event_id", using: :btree
  add_index "events_resources", ["resource_id"], name: "index_events_resources_on_resource_id", using: :btree

  create_table "institutes", force: :cascade do |t|
    t.integer  "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resources", force: :cascade do |t|
    t.integer  "code"
    t.string   "name"
    t.string   "description"
    t.integer  "capacity"
    t.integer  "resource_id"
    t.integer  "area_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "resources", ["area_id"], name: "index_resources_on_area_id", using: :btree
  add_index "resources", ["resource_id"], name: "index_resources_on_resource_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "activities", "beneficiaries"
  add_foreign_key "activities", "events"
  add_foreign_key "activities_resources", "activities"
  add_foreign_key "activities_resources", "resources"
  add_foreign_key "areas", "institutes"
  add_foreign_key "beneficiaries_resources", "beneficiaries"
  add_foreign_key "beneficiaries_resources", "resources"
  add_foreign_key "events", "beneficiaries"
  add_foreign_key "events_resources", "events"
  add_foreign_key "events_resources", "resources"
  add_foreign_key "resources", "areas"
  add_foreign_key "resources", "resources"
end
