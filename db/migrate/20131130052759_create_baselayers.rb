class CreateBaselayers < ActiveRecord::Migration
  def change
    create_table :baselayers do |t|
      t.string :image
      t.integer :width
      t.integer :height
      t.integer :zoomlevels
      t.integer :tilesize
      t.string :name
      t.text :description
      t.string :domain

      t.timestamps
    end
  end
end
