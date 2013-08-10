json.array!(@tenant_contact_links) do |tenant_contact_link|
  json.extract! tenant_contact_link, :tenant_id, :contact_id, :start_date, :end_date
  json.url tenant_contact_link_url(tenant_contact_link, format: :json)
end
