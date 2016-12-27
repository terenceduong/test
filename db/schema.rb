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

ActiveRecord::Schema.define(version: 20161227175015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collaboration_callbacks", force: true do |t|
    t.string   "request_method"
    t.string   "host"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enrolments", force: true do |t|
    t.integer  "offering_id"
    t.integer  "iqualify_user_id"
    t.boolean  "isFacilitator"
    t.boolean  "isReadonly"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "enrolments", ["iqualify_user_id"], name: "index_enrolments_on_iqualify_user_id", using: :btree
  add_index "enrolments", ["offering_id"], name: "index_enrolments_on_offering_id", using: :btree

  create_table "iqualify_users", force: true do |t|
    t.string   "iqualifyId"
    t.text     "email"
    t.string   "studentId"
    t.text     "firstName"
    t.text     "lastName"
    t.string   "mobile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "iqualify_users", ["email"], name: "index_iqualify_users_on_email", unique: true, using: :btree
  add_index "iqualify_users", ["iqualifyId"], name: "index_iqualify_users_on_iqualifyId", unique: true, using: :btree
  add_index "iqualify_users", ["studentId"], name: "index_iqualify_users_on_studentId", using: :btree

  create_table "offerings", force: true do |t|
    t.text     "iqualifyId"
    t.text     "name"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "offerings", ["iqualifyId"], name: "index_offerings_on_iqualifyId", using: :btree
  add_index "offerings", ["name"], name: "index_offerings_on_name", using: :btree

  create_table "projects", force: true do |t|
    t.string   "iqualifyId"
    t.text     "name"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["iqualifyId"], name: "index_projects_on_iqualifyId", using: :btree
  add_index "projects", ["name"], name: "index_projects_on_name", using: :btree

  create_table "rails_lti2_provider_lti_launches", force: true do |t|
    t.integer  "tool_id",    limit: 8
    t.string   "nonce"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rails_lti2_provider_registrations", force: true do |t|
    t.string   "uuid"
    t.text     "registration_request_params"
    t.text     "tool_proxy_json"
    t.string   "workflow_state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tool_id",                     limit: 8
    t.text     "correlation_id"
  end

  add_index "rails_lti2_provider_registrations", ["correlation_id"], name: "index_rails_lti2_provider_registrations_on_correlation_id", unique: true, using: :btree

  create_table "rails_lti2_provider_tools", force: true do |t|
    t.string   "uuid"
    t.text     "shared_secret"
    t.text     "tool_settings"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lti_version"
  end

end
