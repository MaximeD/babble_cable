class AddTokenToRoomsWithIndexes < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :token, :string, default: "", null: false
    add_column :rooms, :private, :boolean, default: false, null: false


    add_index :rooms, :token, unique: true
    add_index :rooms, :name, unique: true
  end
end
