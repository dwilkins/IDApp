json.array!(@tenants) do |tenant|
  json.extract! tenant, :name, :abbreviation, :primary_contact
  json.url tenant_url(tenant, format: :json)
end
