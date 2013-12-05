json.array!(@geometries) do |geometry|
  json.extract! geometry, :id, :room_id, :geometry
  json.url geometry_url(geometry, format: :json)
end
