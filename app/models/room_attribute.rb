class RoomAttribute < ActiveRecord::Base

  validates_uniqueness_of :name, :abbreviation

  has_many :rooms, through: :room_room_attribute_links

end
