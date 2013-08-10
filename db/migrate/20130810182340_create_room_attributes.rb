class CreateRoomAttributes < ActiveRecord::Migration
  def change
    create_table :room_attributes do |t|
      t.string :name
      t.string :abbreviation

      t.timestamps
    end
  end
end
