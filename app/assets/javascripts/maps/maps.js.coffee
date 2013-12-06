# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


  handle_styles = new OpenLayers.StyleMap(
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
    )

  window.geojson = new OpenLayers.Format.GeoJSON()

  id_rooms= new OpenLayers.Layer.XYZ("InnovationDepot","/assets/map-tiles/${z}/map_${x}_${y}.png",
    isBaseLayer: true
    numZoomLevels: 6
    maxExtent: new OpenLayers.Bounds(0,0,8192,8192)
    maxResolution:8192 / 256,
    numZoomLevels: 6
    projection: 'longlat'
    )

  window.polygon_layer = new OpenLayers.Layer.Vector("Polygon Layer"
    styleMap: handle_styles
    attribution: window.logo_html
    )

  load_geometries = ->
    $.get( "/geometries.json", ( data ) ->
      window.polygon_layer.addFeatures(
        for geometry in data
          f = window.geojson.read(geometry.geometry,"Feature")
          f.attributes.remote_id = geometry.id
          f
      )
    )

  window.map_init = ->
    window.map = new OpenLayers.Map(
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
    window.map.addLayers([id_rooms,window.polygon_layer])
    window.map.setCenter(new OpenLayers.LonLat(4096, 4096), 2)
    window.map.zoomToMaxExtent()

    load_geometries()


  jQuery ->
    jQuery.get '/maps/navbar', (data)->
      window.navbar_html = data
      id_rooms.attribution = data
      jQuery.get '/maps/logo', (data)->
        window.logo_html = data
        window.polygon_layer.attribution = data
        window.map_init()
        window.map_edit_init() if window.map_edit_init
