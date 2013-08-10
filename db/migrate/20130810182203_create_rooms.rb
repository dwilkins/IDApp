class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :floor
      t.string :other_names
      t.decimal :square_footage
      t.string :dimensions
      t.timestamps
    end
  end
end
