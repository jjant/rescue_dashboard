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

ActiveRecord::Schema.define(version: 20170422220417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "catastrophes", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "affected_people"
    t.integer  "affected_surface"
    t.integer  "drones"
    t.string   "agents_online"
    t.string   "integer"
    t.string   "lat"
    t.string   "lng"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "affected_buildings"
    t.string   "people_rescued"
    t.string   "building_rescued"
    t.string   "surface_covered"
  end

  create_table "drone_reports", force: :cascade do |t|
    t.string   "message"
    t.integer  "catastrophe_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["catastrophe_id"], name: "index_drone_reports_on_catastrophe_id", using: :btree
  end

  add_foreign_key "drone_reports", "catastrophes"
end
