class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :name
      t.string :abbreviation
      t.integer :primary_contact_id

      t.timestamps
    end
  end
end
