class RoomDocument < ActiveRecord::Migration[5.0]
  def change

    create_table "room_documents", force: :cascade do |t|
      t.string "uuid", limit: 255
      t.string "title", limit: 255
      t.text "comment"
      t.string "element", limit: 255
      t.json 'options'
      t.integer "room_id"
      t.integer "user_id"
      t.string "state", limit: 255 # uploading, uploaded, deleted
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    add_index :room_documents, [:uuid]
    add_index :room_documents, [:title]
    add_index :room_documents, [:room_id]
    add_index :room_documents, [:user_id]
    add_index :room_documents, [:state]
    add_index :room_documents, [:updated_at]
  end
end





