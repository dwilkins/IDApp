json.array!(@room_tenant_links) do |room_tenant_link|
  json.extract! room_tenant_link, :room_id, :tenant_id, :start_date, :end_date
  json.url room_tenant_link_url(room_tenant_link, format: :json)
end
