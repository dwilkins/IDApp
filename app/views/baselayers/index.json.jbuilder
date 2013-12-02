json.array!(@baselayers) do |baselayer|
  json.extract! baselayer, :image, :width, :height, :zoomlevels, :tilesize, :name, :description, :domain
  json.url baselayer_url(baselayer, format: :json)
end
