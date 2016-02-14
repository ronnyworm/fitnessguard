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

ActiveRecord::Schema.define(version: 20160214121439) do

  create_table "regions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "runs", force: true do |t|
    t.date     "date"
    t.string   "participants"
    t.decimal  "km",           precision: 5, scale: 1
    t.integer  "duration"
    t.integer  "max_pulse"
    t.text     "comments"
    t.string   "map_link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "starting_points", force: true do |t|
    t.integer  "region_id"
    t.string   "name"
    t.string   "map_link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tracks", force: true do |t|
    t.integer  "starting_point_id"
    t.string   "name"
    t.boolean  "night_track"
    t.string   "map_link"
    t.decimal  "km",                precision: 5, scale: 1
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tracks", ["starting_point_id"], name: "index_tracks_on_starting_point_id"

end
