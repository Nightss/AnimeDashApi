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

ActiveRecord::Schema.define(version: 2018_11_13_101201) do

  create_table "anime", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "en_title"
    t.text "jp_title"
    t.string "type"
    t.string "status"
    t.integer "score"
    t.integer "rating"
    t.integer "episode_count"
    t.float "episodelength"
    t.text "description"
    t.string "picture"
    t.date "start_date"
    t.date "end_date"
    t.integer "kitsu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "anime_tags", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "anime_id", null: false
    t.bigint "tag_id", null: false
    t.index ["anime_id", "tag_id"], name: "index_anime_tags_on_anime_id_and_tag_id"
  end

  create_table "tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "kitsu_id"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
