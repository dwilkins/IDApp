window.BaseLayer = class BaseLayer
  constructor: (@map_name, @map_domain, @tiles_dir) ->
    @handle_styles = new OpenLayers.StyleMap
      "default":
        graphicName: "${type}"
        pointRadius: 10
        strokeColor: "fuchsia"
        strokeWidth: 2
        fillColor: "lime"
        fillOpacity: 0.2
        strokeDashstyle: "solid"
      "handle":
        graphicName: "${type}"
        pointRadius: 10
        strokeColor: "black"
        strokeDashstyle: "dot"
        strokeWidth: 2
        fillColor: "white"
        fillOpacity: 0.2
      "invisible":
        display: "none"
      "select":
        strokeDashstyle: "dot"
        fillOpacity: 0.5

    @polygon_layer = new OpenLayers.Layer.Vector("Polygon Layer",
      styleMap: @handle_styles
      attribution: window.logo_html
    )

    if not @map_name
      @map_name = $("#map").data("map_name")
    if not @tiles_dir
      @tiles_dir = $("#map").data("map_tiles_dir")
    if not @map_domain
      @map_domain = $("#map").data("map_domain")

    @geojson = new OpenLayers.Format.GeoJSON()

    @base_layer = new OpenLayers.Layer.XYZ(@map_name,@tiles_dir + "/" + @map_domain +  "/${z}/map_${x}_${y}.png",
      isBaseLayer: true
      numZoomLevels: 6
      maxExtent: new OpenLayers.Bounds(0,0,8192,8192)
      maxResolution:8192 / 256,
      numZoomLevels: 6
      projection: 'longlat'
      )

  getGeometries: ->
    $.get( "/geometries.json", ( data ) =>
      @polygon_layer.addFeatures(
        for geometry in data
          f = @geojson.read(geometry.geometry,"Feature")
          f.attributes.remote_id = geometry.id
          f
      )
    )

  createMap: ->
    @ol_map = new OpenLayers.Map(
      div: "map",
      displayProjection: 'longlat'
      projection: 'longlat'
      numZoomLevels: 6
      controls:[
        new OpenLayers.Control.MousePosition()
        new OpenLayers.Control.Navigation()
        new OpenLayers.Control.PanZoomBar()
        new OpenLayers.Control.LayerSwitcher()
        new OpenLayers.Control.Attribution(" | ", "${layers}" )
      ]
    )
    @ol_map.addLayers([@base_layer,@polygon_layer])
    @ol_map.setCenter(new OpenLayers.LonLat(4096, 4096), 2)
    @ol_map.zoomToMaxExtent()
    @getGeometries()

