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

ActiveRecord::Schema.define(version: 20171114190927) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "players", force: :cascade do |t|
    t.integer "index"
    t.string "full_name"
    t.string "position"
    t.string "team"
    t.integer "week"
    t.integer "tar"
    t.integer "rec"
    t.integer "rec_yards"
    t.integer "yac"
    t.integer "air_yards"
    t.integer "tm_att"
    t.integer "tm_airyards"
    t.integer "aypt"
    t.integer "racr"
    t.integer "ms_air_yards"
    t.integer "target_share"
    t.integer "wopr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
