json.array!(@room_attributes) do |room_attribute|
  json.extract! room_attribute, :name, :abbreviation
  json.url room_attribute_url(room_attribute, format: :json)
end
