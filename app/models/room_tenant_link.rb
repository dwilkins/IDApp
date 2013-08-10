class RoomTenantLink < ActiveRecord::Base

  belongs_to :tenant
  belongs_to :room
end
