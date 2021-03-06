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

ActiveRecord::Schema.define(version: 20160929030324) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appearances", force: :cascade do |t|
    t.integer  "reading_id"
    t.integer  "card_id"
    t.integer  "position_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "reversed"
    t.index ["card_id"], name: "index_appearances_on_card_id", using: :btree
    t.index ["position_id"], name: "index_appearances_on_position_id", using: :btree
    t.index ["reading_id"], name: "index_appearances_on_reading_id", using: :btree
  end

  create_table "cards", force: :cascade do |t|
    t.integer  "deck_id"
    t.string   "name"
    t.integer  "suit_id"
    t.integer  "ordering"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deck_id"], name: "index_cards_on_deck_id", using: :btree
    t.index ["suit_id"], name: "index_cards_on_suit_id", using: :btree
  end

  create_table "decks", force: :cascade do |t|
    t.integer  "tradition_id"
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["tradition_id"], name: "index_decks_on_tradition_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "location"
    t.string   "facebook_url"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "querent_id"
    t.string   "provider"
    t.string   "accesstoken"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "nickname"
    t.string   "image"
    t.string   "phone"
    t.string   "urls"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["querent_id"], name: "index_identities_on_querent_id", using: :btree
  end

  create_table "interpretations", force: :cascade do |t|
    t.integer  "card_id"
    t.string   "phrase"
    t.text     "description"
    t.integer  "reader_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "appearance_id"
    t.index ["card_id"], name: "index_interpretations_on_card_id", using: :btree
    t.index ["reader_id"], name: "index_interpretations_on_reader_id", using: :btree
  end

  create_table "lines", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "reader_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "position_in_room"
    t.index ["event_id"], name: "index_lines_on_event_id", using: :btree
    t.index ["reader_id"], name: "index_lines_on_reader_id", using: :btree
  end

  create_table "logistics", force: :cascade do |t|
    t.string   "name"
    t.text     "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.integer  "line_id"
    t.integer  "querent_id"
    t.integer  "ordering"
    t.boolean  "complete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_id"], name: "index_places_on_line_id", using: :btree
    t.index ["querent_id"], name: "index_places_on_querent_id", using: :btree
  end

  create_table "positions", force: :cascade do |t|
    t.integer  "spread_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "ordering"
    t.index ["spread_id"], name: "index_positions_on_spread_id", using: :btree
  end

  create_table "querents", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "moniker"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
    t.string   "avatar"
    t.boolean  "avatar_approved",        default: false
    t.index ["confirmation_token"], name: "index_querents_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_querents_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_querents_on_reset_password_token", unique: true, using: :btree
  end

  create_table "readers", force: :cascade do |t|
    t.string   "moniker"
    t.string   "first_name"
    t.string   "last_name"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
    t.string   "phone"
    t.string   "avatar"
    t.index ["confirmation_token"], name: "index_readers_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_readers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_readers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "readings", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "reader_id"
    t.integer  "querent_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "deck_id"
    t.integer  "spread_id"
    t.boolean  "private",    default: false
    t.index ["event_id"], name: "index_readings_on_event_id", using: :btree
    t.index ["reader_id"], name: "index_readings_on_reader_id", using: :btree
  end

  create_table "spreads", force: :cascade do |t|
    t.integer  "tradition_id"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "name"
    t.index ["tradition_id"], name: "index_spreads_on_tradition_id", using: :btree
  end

  create_table "suits", force: :cascade do |t|
    t.string   "name"
    t.string   "symbol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "traditions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "appearances", "cards"
  add_foreign_key "appearances", "positions"
  add_foreign_key "appearances", "readings"
  add_foreign_key "cards", "decks"
  add_foreign_key "decks", "traditions"
  add_foreign_key "identities", "querents"
  add_foreign_key "interpretations", "cards"
  add_foreign_key "lines", "events"
  add_foreign_key "lines", "readers"
  add_foreign_key "places", "lines"
  add_foreign_key "places", "querents"
  add_foreign_key "positions", "spreads"
  add_foreign_key "readings", "events"
  add_foreign_key "readings", "readers"
  add_foreign_key "spreads", "traditions"
end
