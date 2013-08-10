json.array!(@room_room_attribute_links) do |room_room_attribute_link|
  json.extract! room_room_attribute_link, :room_id, :room_attribute_id, :start_date, :end_date
  json.url room_room_attribute_link_url(room_room_attribute_link, format: :json)
end
