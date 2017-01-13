class AddSubscribersCountToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :subscribers_count, :integer, default: 0, null: false
  end
end
