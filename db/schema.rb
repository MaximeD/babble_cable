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

ActiveRecord::Schema.define(version: 20171003114739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.text     "text"
    t.integer  "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_messages_on_room_id", using: :btree
  end

  create_table "room_documents", force: :cascade do |t|
    t.string   "uuid",       limit: 255
    t.string   "title",      limit: 255
    t.text     "comment"
    t.string   "element",    limit: 255
    t.json     "options"
    t.integer  "room_id"
    t.integer  "user_id"
    t.string   "state",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["room_id"], name: "index_room_documents_on_room_id", using: :btree
    t.index ["state"], name: "index_room_documents_on_state", using: :btree
    t.index ["title"], name: "index_room_documents_on_title", using: :btree
    t.index ["updated_at"], name: "index_room_documents_on_updated_at", using: :btree
    t.index ["user_id"], name: "index_room_documents_on_user_id", using: :btree
    t.index ["uuid"], name: "index_room_documents_on_uuid", using: :btree
  end

  create_table "rooms", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "subscribers_count", default: 0,     null: false
    t.string   "token",             default: "",    null: false
    t.boolean  "private",           default: false, null: false
    t.index ["name"], name: "index_rooms_on_name", unique: true, using: :btree
    t.index ["token"], name: "index_rooms_on_token", unique: true, using: :btree
  end

  add_foreign_key "messages", "rooms"
end
