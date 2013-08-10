class Room < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :room_tenant_links
  has_many :tenants, through: :room_tenant_links

  has_many :room_room_attribute_links
  has_many :room_attributes, through: :room_room_attribute_links

end
