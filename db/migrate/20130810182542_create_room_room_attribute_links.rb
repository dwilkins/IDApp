class CreateRoomRoomAttributeLinks < ActiveRecord::Migration
  def change
    create_table :room_room_attribute_links do |t|
      t.integer :room_id
      t.integer :room_attribute_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
