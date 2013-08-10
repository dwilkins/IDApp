class CreateRoomTenantLinks < ActiveRecord::Migration
  def change
    create_table :room_tenant_links do |t|
      t.integer :room_id
      t.integer :tenant_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
