class RoomRoomAttributeLink < ActiveRecord::Base
  belongs_to :room
  belongs_to :room_attribute
end
