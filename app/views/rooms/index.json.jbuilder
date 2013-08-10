json.array!(@rooms) do |room|
  json.extract! room, :name, :other_names
  json.url room_url(room, format: :json)
end
