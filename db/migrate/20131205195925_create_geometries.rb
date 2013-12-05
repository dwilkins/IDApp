class CreateGeometries < ActiveRecord::Migration
  def change
    create_table :geometries do |t|
      t.integer :room_id
      t.text :geometry

      t.timestamps
    end
  end
end
