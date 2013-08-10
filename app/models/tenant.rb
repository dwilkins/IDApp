class Tenant < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_uniqueness_of :abbreviation, allow_nil: true
  validates_presence_of :name
#  validates_presence_of :primary_contact_id

  has_many :rooms, through: :room_tenant_links
  has_many :contacts, through: :tenant_contact_links
  belongs_to :primary_contact, class_name: 'Contact', inverse_of: :primary_tenants


end
