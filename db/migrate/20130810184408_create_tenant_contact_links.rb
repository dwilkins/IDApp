class CreateTenantContactLinks < ActiveRecord::Migration
  def change
    create_table :tenant_contact_links do |t|
      t.integer :tenant_id
      t.integer :contact_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
