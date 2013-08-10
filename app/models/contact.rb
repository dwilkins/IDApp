class Contact < ActiveRecord::Base

  has_many :tenants, through: :tenant_contact_links
  has_many :primary_tenants, through: :tenants, primary_key: :primary_contact_id, inverse_of: :primary_contact


  def to_s
    self.name
  end
end
