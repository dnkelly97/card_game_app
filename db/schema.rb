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

ActiveRecord::Schema.define(version: 2020_11_15_224204) do

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.integer "pile_id"
    t.index ["pile_id"], name: "index_cards_on_pile_id"
  end

  create_table "piles", force: :cascade do |t|
    t.string "name"
    t.string "creator"
    t.boolean "private_pile"
    t.integer "card_count"
    t.integer "room_id"
    t.index ["room_id"], name: "index_piles_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "max_players"
    t.string "game_type"
    t.boolean "private"
    t.string "room_code"
    t.index ["room_code"], name: "index_rooms_on_room_code", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "user_id"
    t.string "email"
    t.string "password_digest"
    t.string "provider"
    t.string "session_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "room_id"
    t.index ["room_id"], name: "index_users_on_room_id"
  end

end
